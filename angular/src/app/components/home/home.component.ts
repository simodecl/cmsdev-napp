import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { HeaderService } from 'src/app/services/header.service';
import { PostService } from 'src/app/services/post.service';
import { User } from 'src/app/models/user';
import { Selfie } from 'src/app/models/selfie';
import { FormGroup, FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  currentUser: User;
  following: string;
  selfies: Selfie[];
  selectedFile: File;
  postSelfie: FormGroup;
  errors: String;
  placeholderImg = '/assets/placeholder.jpg';

  constructor(
    private headerService: HeaderService,
    private postService: PostService,
    private authService: AuthService,
    private fb: FormBuilder) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Tijdlijn');
    });
    this.postSelfie = this.fb.group({
      featured_media: [],
      hashtag: [],
      title: [''],
      status: ['pending']
    });
    this.getCurrentUser();
  }
  getCurrentUser() {
    this.authService.getCurrentUser<User>().subscribe(user => {
      this.currentUser = user;
      if (user.acf.following) {
        const authors = user.acf.following.toString() + ',' + user.id.toString();
        this.getSelfies(authors);
      } else {
        this.getSelfies(user.id.toString());
      }
    }, err => {
      console.error(err);
    });
  }

  getSelfies(following) {
    this.postService.getSelfiesByFollowing<Selfie[]>(following).subscribe(selfies => {
      this.selfies = selfies;
      console.log(this.selfies);
    }, err => {
      console.error(err);
    });
  }

  toggleLike(selfie, index) {
    let newLike = [];
    if (selfie.acf.likes) {
      newLike = selfie.acf.likes;
    }
    if (newLike.includes(this.currentUser.id)) {
      const i = newLike.indexOf(this.currentUser.id);
      if (i > -1) {
        newLike.splice(i, 1);
        this.selfies[index].acf.likes = newLike;
      }
    } else {
      newLike.push(this.currentUser.id);
      this.selfies[index].acf.likes = newLike;
    }
    const settings = {
      'fields': {
        'likes': newLike
      }
    };
    this.postService.updateSelfie(settings, selfie.id).subscribe(res => {
      console.log(res);
    }, err => {
      console.error(err);
    });
  }

  deleteSelfie(id) {
    this.postService.deleteSelfie<Selfie>(id).subscribe(res => {
      this.getCurrentUser();
    }, err => {
      console.error(err);
    });
  }

  openModal(id) {
    const modal = document.getElementById('delete' + id);
    modal.style.display = 'block';
  }

  closeModal(id) {
    const modal = document.getElementById('delete' + id);
    modal.style.display = 'none';
  }
}
