import { Component, OnInit } from '@angular/core';
import { HeaderService } from 'src/app/services/header.service';
import { User } from 'src/app/models/user';
import { ProfileService } from 'src/app/services/profile.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-profiles',
  templateUrl: './profiles.component.html',
  styleUrls: ['./profiles.component.scss']
})
export class ProfilesComponent implements OnInit {
  profiles: User[];
  placeholderImg = '/assets/placeholder.jpg';

  constructor(
    private headerService: HeaderService,
    private profileService: ProfileService,
    private authService: AuthService) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Profielen');
    });
    this.getProfiles();
  }

  getProfiles() {
    this.profileService.getUsers<User[]>().subscribe(res => {
      this.profiles = res;
      console.log(this.profiles);
    }, err => {
      console.error(err);
    });
  }

  follow(id) {
    const currentUser = this.authService.getDecodedToken().data.user.id;
    this.profileService.getUserById<User>(currentUser).subscribe(user => {
      console.log(user);
      const newFollow = user.acf.following;
      newFollow.push(id);
      const settings = {
        'fields': {
          'following': newFollow
        }
      };
      console.log(settings);
      this.profileService.updateSettings(settings, currentUser).subscribe(res => {
        console.log(res);
      }, err => {
        console.error(err);
      });

    }, err => {
      console.error(err);
    });
  }
}
