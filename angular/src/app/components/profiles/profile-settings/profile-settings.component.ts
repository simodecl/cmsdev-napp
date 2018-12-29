import { User } from 'src/app/models/user';
import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ProfileService } from 'src/app/services/profile.service';
import { HeaderService } from 'src/app/services/header.service';

@Component({
  selector: 'app-profile-settings',
  templateUrl: './profile-settings.component.html',
  styleUrls: ['./profile-settings.component.scss']
})
export class ProfileSettingsComponent implements OnInit {
  selectedFile: File;
  fields: FormGroup;
  placeholderImg = '/assets/placeholder.jpg';
  fieldsData;
  dateData;
  user: User;


  constructor(
    private profileService: ProfileService,
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private headerService: HeaderService) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Profiel bewerken');
    });
    this.fields = this.fb.group({
      avatar: [],
      school: [''],
      goaldate: [''],
      goalamount: ['']
    });
    this.getProfile();
  }

  onFileChanged(event) {
    this.selectedFile = event.target.files[0];
    const imgfields = document.querySelectorAll('.avatar');
    for (let i = 0; i < imgfields.length; i++) {
      imgfields[i].setAttribute('src', URL.createObjectURL(event.target.files[0]));
    }
    console.log(this.selectedFile);
  }

  updateSettings() {
    if (this.selectedFile) {
      const formData = new FormData();
      formData.append('file', this.selectedFile);
      this.profileService.uploadFile(formData).subscribe(image => {
        // Handle result
        console.log(image);
        this.fields.patchValue({
          avatar: image.id
        });

        const settings = {
          'fields': this.fields.value
        };
        const id = this.route.snapshot.paramMap.get('id');
        this.profileService.updateSettings(settings, id).subscribe(res => {
          console.log(res);
          this.router.navigate([`profile/${id}`]);
        }, err => {
          console.error(err);
        });

      },
      error => {
        console.error(error);
      });
    } else {
      this.fieldsData = this.fields.value;
      this.dateData = new Date(this.fieldsData.goaldate);
      this.dateData = (this.dateData.getMonth() + 1) + '/' + this.dateData.getDate() + '/' +  this.dateData.getFullYear();
      this.fields.patchValue({
        goaldate: this.dateData
      });
      const settings = {
        'fields': this.fields.value
      };
      console.log(settings);
      const id = this.route.snapshot.paramMap.get('id');
      this.profileService.updateSettings(settings, id).subscribe(res => {
        console.log(res);
        this.router.navigate([`profile/${id}`]);
      }, err => {
        console.error(err);
      });
    }
  }

  getProfile() {
    const id = this.route.snapshot.paramMap.get('id');
    this.profileService.getUserById<User>(id).subscribe(user => {
      console.log(user);
      this.fields.patchValue({
        avatar: user.acf.avatar.id,
        school: user.acf.school,
        goaldate: new Date(user.acf.goaldate),
        goalamount: user.acf.goalamount
      });
      this.user = user;
      console.log(this.fields.value);
    }, err => {
      console.error(err);
    });
  }
}
