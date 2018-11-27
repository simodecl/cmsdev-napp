import { Component, OnInit } from '@angular/core';
import { SettingsService } from 'src/app/services/settings.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  selectedFile: File;

  constructor(private settingsService: SettingsService, private authService: AuthService) { }

  ngOnInit() {
    this.authService.getCurrentUser().subscribe(result => {
      // Handle result
      console.log(result);
    },
    error => {
      console.error(error);
    },
    () => {
      // Route to new page
    });
  }

  onFileChanged(event) {
    this.selectedFile = event.target.files[0];
    console.log(this.selectedFile);
  }

  updateSettings() {
    const formData = new FormData();
    formData.append('file', this.selectedFile);
    this.settingsService.uploadFile(formData).subscribe(result => {
      // Handle result
      console.log(result);
      this.settingsService.updateSettings(result).subscribe(res => {
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
