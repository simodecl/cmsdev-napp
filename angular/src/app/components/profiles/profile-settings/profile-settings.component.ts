import { User } from 'src/app/models/user';
import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ProfileService } from 'src/app/services/profile.service';

@Component({
  selector: 'app-profile-settings',
  templateUrl: './profile-settings.component.html',
  styleUrls: ['./profile-settings.component.scss']
})
export class ProfileSettingsComponent implements OnInit {
  selectedFile: File;
  fields: FormGroup;


  constructor(
    private profileService: ProfileService,
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router) { }

  ngOnInit() {
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
    }
  }

  getProfile() {
    const id = this.route.snapshot.paramMap.get('id');
      this.profileService.getUserById<User>(id).subscribe(user => {
        console.log(user);
        this.fields.patchValue({
          avatar: user.acf.avatar.id,
          school: user.acf.school,
          goaldate: user.acf.goaldate,
          goalamount: user.acf.goalamount
        });
        console.log(this.fields.value);
      }, err => {
        console.error(err);
      });
  }
}
