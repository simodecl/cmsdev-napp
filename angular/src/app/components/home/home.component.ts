import { Component, OnInit } from '@angular/core';
import { ImageService } from 'src/app/services/image.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  selectedFile: File;

  constructor(private imageService: ImageService, private authService: AuthService) { }

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

  onUpload() {
    const formData = new FormData();
    formData.append('file', this.selectedFile);
    this.imageService.upload(formData).subscribe(result => {
      // Handle result
      console.log(result);
      this.imageService.uploadAvatar(result).subscribe(res => {
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
