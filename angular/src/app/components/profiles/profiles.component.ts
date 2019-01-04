import { Component, OnInit } from '@angular/core';
import { HeaderService } from 'src/app/services/header.service';
import { User } from 'src/app/models/user';
import { ProfileService } from 'src/app/services/profile.service';
import { AuthService } from 'src/app/services/auth.service';
import { FormGroup, FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-profiles',
  templateUrl: './profiles.component.html',
  styleUrls: ['./profiles.component.scss']
})
export class ProfilesComponent implements OnInit {
  profiles: User[];
  placeholderImg = '/assets/placeholder.jpg';
  currentUser: User;
  search: FormGroup;

  constructor(
    private headerService: HeaderService,
    private profileService: ProfileService,
    private authService: AuthService,
    private fb: FormBuilder) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Profielen');
    });
    this.search = this.fb.group({
      input: [''],
    });
    this.getCurrentUser();
    this.getProfiles();
  }

  getCurrentUser() {
    this.authService.getCurrentUser<User>().subscribe(user => {
      this.currentUser = user;
      console.log(this.currentUser);
    }, err => {
      console.error(err);
    });
  }

  getProfiles() {
    this.profileService.getUsers<User[]>().subscribe(res => {
      this.profiles = res;
      console.log(res);
    }, err => {
      console.error(err);
    });
  }

  searchProfiles(query: String) {
    this.profileService.searchUsers<User[]>(query).subscribe(res => {
      this.profiles = res;
      console.log(res);
    }, err => {
      console.error(err);
    });
  }

  follow(id) {
    const newFollow = this.currentUser.acf.following;
    if (newFollow.includes(id)) {
      newFollow.filter(e => e !== id);
    } else {
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
