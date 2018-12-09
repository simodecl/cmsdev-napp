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
  placeholderImg = '/assets/placeholder.jpg';
  dateString;
  dateParts;
  dateObject;
  following = [];

  constructor(
    private profileService: ProfileService,
    private route: ActivatedRoute,
    private router: Router,
    private headerService: HeaderService
  ) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Profiel');
    });
    this.getProfile();
  }

  getProfile() {
    const id = this.route.snapshot.paramMap.get('id');
    this.profileService.getUserById<User>(id).subscribe(res => {
      this.profile = res;
      if (res.acf.goaldate) {
        this.dateString = res.acf.goaldate;
        this.dateObject = new Date(this.dateString); // month is 0-based
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        this.profile.acf.goaldate = this.dateObject.toLocaleDateString('nl-BE', options);
      }
      console.log(this.profile);
      this.profile.acf.following.forEach(followId => {
        this.profileService.getUserById<User>(followId.toString()).subscribe(followed => {
            this.following.push(followed);
        }, err => {
          console.error(err);
        });
      });
      console.log(this.following);
    }, err => {
      console.error(err);
    });
  }
}
