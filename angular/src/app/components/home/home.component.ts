import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { HeaderService } from 'src/app/services/header.service';
import { PostService } from 'src/app/services/post.service';
import { User } from 'src/app/models/user';
import { Selfie } from 'src/app/models/selfie';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  currentUser: User;
  following: string;
  selfies: Selfie[];

  constructor(
    private headerService: HeaderService,
    private postService: PostService,
    private authService: AuthService) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Tijdlijn');
    });
    this.getCurrentUser();
  }
  getCurrentUser() {
    this.authService.getCurrentUser<User>().subscribe(user => {
      this.currentUser = user;
      this.getSelfies(user.acf.following.toString());
    }, err => {
      console.error(err);
    });
  }

  getSelfies(following) {
    // For testing purposes, show posts of user 1 instead
    this.postService.getSelfiesByFollowing<Selfie[]>(('1')).subscribe(selfies => {
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
    console.log(newLike);
    if (newLike.includes(this.currentUser.id)) {
      const i = newLike.indexOf(this.currentUser.id);
      if (i > -1) {
        newLike.splice(i, 1);
        this.selfies[index].acf.likes = newLike;
      }
      console.log(newLike);
    } else {
      newLike.push(this.currentUser.id);
      this.selfies[index].acf.likes = newLike;
      console.log(this.selfies[index].acf.likes);
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
