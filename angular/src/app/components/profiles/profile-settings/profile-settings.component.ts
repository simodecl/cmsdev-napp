import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { SettingsService } from 'src/app/services/settings.service';
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

  constructor(private settingsService: SettingsService, private authService: AuthService) { }

  ngOnInit() {
  }

  onFileChanged(event) {
    this.selectedFile = event.target.files[0];
    console.log(this.selectedFile);
  }

  updateSettings() {
    const formData = new FormData();
    formData.append('file', this.selectedFile);
    this.settingsService.uploadFile(formData).subscribe(image => {
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
      this.settingsService.updateSettings(settings).subscribe(res => {
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
