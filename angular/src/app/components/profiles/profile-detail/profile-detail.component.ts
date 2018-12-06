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
  profile;
  placeholderImg = '/assets/placeholder.jpg';
  dateString;
  dateParts;
  dateObject;

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
    }, err => {
      console.error(err);
    });
  }
}
