import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ProfileService } from 'src/app/services/profile.service';

@Component({
  selector: 'app-profile-detail',
  templateUrl: './profile-detail.component.html',
  styleUrls: ['./profile-detail.component.scss']
})
export class ProfileDetailComponent implements OnInit {

  constructor(
    private profileService: ProfileService,
    private route: ActivatedRoute,
    private router: Router
  ) { }

  ngOnInit() {
    this.getProfile();
  }

  getProfile() {
    const id = this.route.snapshot.paramMap.get('id');
    this.profileService.getUserById(id).subscribe(res => {
      console.log(res);
    }, err => {
      console.error(err);
    });
  }
}
