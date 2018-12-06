import { Component, OnInit } from '@angular/core';
import { HeaderService } from 'src/app/services/header.service';
import { User } from 'src/app/models/user';
import { ProfileService } from 'src/app/services/profile.service';

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
    private profileService: ProfileService) { }

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
}
