import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { ProfileService } from 'src/app/services/profile.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-profile-settings',
  templateUrl: './profile-settings.component.html',
  styleUrls: ['./profile-settings.component.scss']
})
export class ProfileSettingsComponent implements OnInit {
  selectedFile: File;
  school = '';
  goaldate = '';
  goalamount = '';

  constructor(private profileService: ProfileService, private authService: AuthService) { }

  ngOnInit() {
  }

  onFileChanged(event) {
    this.selectedFile = event.target.files[0];
    console.log(this.selectedFile);
  }

  updateSettings() {
    const formData = new FormData();
    formData.append('file', this.selectedFile);
    this.profileService.uploadFile(formData).subscribe(image => {
      // Handle result
      console.log(image);

      const settings = {
        'meta': {
          'avatar': `${image.id}`,
          'school': this.school,
          'goaldate': this.goaldate.split('/').reverse().join(''),
          'goalamount': this.goalamount,
        }
      };
      this.profileService.updateSettings(settings).subscribe(res => {
        console.log(res);
      }, err => {
        console.error(err);
      });
    },
    error => {
      console.error(error);
    },
    () => {
      // Route to new page
    });
  }
}
