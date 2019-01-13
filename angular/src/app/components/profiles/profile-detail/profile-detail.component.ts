import { AuthService } from './../../../services/auth.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ProfileService } from 'src/app/services/profile.service';
import { User } from 'src/app/models/user';
import { HeaderService } from 'src/app/services/header.service';

@Component({
  selector: 'app-profile-detail',
  templateUrl: './profile-detail.component.html',
  styleUrls: ['./profile-detail.component.scss']
})
export class ProfileDetailComponent implements OnInit {
  profile: User;
  currentUser: User;
  dateString;
  dateParts;
  dateObject;
  following = [];

  constructor(
    private profileService: ProfileService,
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
      this.following = [];
      this.getProfile(param.id);
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

  getProfile(id) {

    this.profileService.getUserById<User>(id).subscribe(res => {
      this.profile = res;
      if (res.acf.goaldate) {
        this.dateString = res.acf.goaldate;
        this.dateObject = new Date(this.dateString); // month is 0-based
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        this.profile.acf.goaldate = this.dateObject.toLocaleDateString('nl-BE', options);
      }
      if (this.profile.acf.following) {
        this.follows();
      }
    }, err => {
      console.error(err);
    });
  }
  follows() {
    this.profile.acf.following.forEach(followId => {
      this.profileService.getUserById<User>(followId.toString()).subscribe(followed => {
          this.following.push(followed);
      }, err => {
        console.error(err);
      });
    });
  }

  follow(id) {
    let newFollow;
    if (this.currentUser.acf.following) {
        newFollow = this.currentUser.acf.following;
      if (newFollow.includes(id)) {
        newFollow.filter(e => e !== id);
      } else {
        newFollow.push(id);
      }
    } else {
      newFollow = [];
      newFollow.push(id);
    }
    const settings = {
      'fields': {
        'following': newFollow
      }
    };
    this.profileService.updateSettings(settings, this.currentUser.id).subscribe(res => {
      console.log(res);
    }, err => {
      console.error(err);
    });
  }

  unfollow(id) {
    const newFollow = this.currentUser.acf.following;
    const i = newFollow.indexOf(id);
    if (i > -1) {
      newFollow.splice(i, 1);
    }
    console.log(newFollow);
    const settings = {
      'fields': {
        'following': newFollow
      }
    };
    this.profileService.updateSettings(settings, this.currentUser.id).subscribe(res => {
      console.log(res);
    }, err => {
      console.error(err);
    });
  }
}
