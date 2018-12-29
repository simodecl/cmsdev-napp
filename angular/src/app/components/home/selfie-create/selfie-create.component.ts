import { Component, OnInit } from '@angular/core';
import { HeaderService } from 'src/app/services/header.service';
import { PostService } from 'src/app/services/post.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-selfie-create',
  templateUrl: './selfie-create.component.html',
  styleUrls: ['./selfie-create.component.scss']
})
export class SelfieCreateComponent implements OnInit {
  selectedFile: File;
  postSelfie: FormGroup;
  errors: String;

  constructor(
    private headerService: HeaderService,
    private postService: PostService,
    private fb: FormBuilder) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Tijdlijn');
    });
    this.postSelfie = this.fb.group({
      featured_media: [],
      hashtag: ['' , Validators.required],
      title: ['', Validators.required],
      status: ['pending']
    });
  }

  onFileChanged(event) {
    this.selectedFile = event.target.files[0];
    const imgfield = document.getElementById('image');
    imgfield.setAttribute('src', URL.createObjectURL(event.target.files[0]));
    console.log(this.selectedFile);
  }

  createSelfie() {
    if (this.selectedFile) {
      if (this.postSelfie.valid) {
        const formData = new FormData();
        formData.append('file', this.selectedFile);
        this.postService.uploadFile(formData).subscribe(image => {
          // Handle result
          console.log(image);
          this.postSelfie.patchValue({
            featured_media: image.id
          });
          const tagObj = {
            'name': this.postSelfie.value.hashtag
          };
          this.postService.postHashtag(tagObj).subscribe(tag => {
            console.log(tag);
            this.postSelfie.patchValue({
              hashtag: tag.id
            });
            this.postService.postSelfie(this.postSelfie.value).subscribe(newSelfie => {
              console.log(newSelfie);
            }, error => {
              console.log(error);
              this.errors = error;
            });

          }, err => {
            console.log(err);
            this.errors = err;
          });
        },
        error => {
          console.error(error);
          this.errors = error;
        });
      } else {
        this.errors = 'Je moet zowel een titel als hashtag ingeven.';
      }
    } else {
      this.errors = 'Je moet een foto uploaden.';
    }
  }
}
