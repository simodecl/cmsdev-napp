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
}
