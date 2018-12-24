import { Component, OnInit } from '@angular/core';
import { Selfie } from 'src/app/models/selfie';
import { User } from 'src/app/models/user';
import { PostService } from 'src/app/services/post.service';
import { AuthService } from 'src/app/services/auth.service';
import { HeaderService } from 'src/app/services/header.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-selfie-detail',
  templateUrl: './selfie-detail.component.html',
  styleUrls: ['./selfie-detail.component.scss']
})
export class SelfieDetailComponent implements OnInit {
  currentUser: User;
  selfie: Selfie;

  constructor(
    private postService: PostService,
    private route: ActivatedRoute,
    private authService: AuthService,
    private headerService: HeaderService
  ) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Profiel');
    });
    this.getCurrentUser();
    this.route.params.subscribe(param => {
      this.getSelfie(param.id);
    });

  }
  getCurrentUser() {
    this.authService.getCurrentUser<User>().subscribe(user => {
      this.currentUser = user;
      console.log(this.currentUser);
    }, err => {
      console.error(err);
    });
  }

  getSelfie(id) {

    this.postService.getSelfieById<Selfie>(id).subscribe(res => {
      this.selfie = res;
    }, err => {
      console.error(err);
    });
  }

  toggleLike(selfie) {
    let newLike = [];
    if (selfie.acf.likes) {
      newLike = selfie.acf.likes;
    }
    if (newLike.includes(this.currentUser.id)) {
      const i = newLike.indexOf(this.currentUser.id);
      if (i > -1) {
        newLike.splice(i, 1);
        this.selfie.acf.likes = newLike;
      }
    } else {
      newLike.push(this.currentUser.id);
      this.selfie.acf.likes = newLike;
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
}
