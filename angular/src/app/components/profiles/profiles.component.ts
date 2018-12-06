import { Component, OnInit } from '@angular/core';
import { HeaderService } from 'src/app/services/header.service';

@Component({
  selector: 'app-profiles',
  templateUrl: './profiles.component.html',
  styleUrls: ['./profiles.component.scss']
})
export class ProfilesComponent implements OnInit {

  constructor(private headerService: HeaderService) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Profielen');
    });
  }

}
