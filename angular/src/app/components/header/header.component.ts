import { Component, OnInit, ViewChild } from '@angular/core';
import { SidenavService } from 'src/app/services/sidenav-service.service';
import { MatSidenav } from '@angular/material';
import { HeaderService } from 'src/app/services/header.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  title = '';

  constructor(
    private sidenavService: SidenavService,
    private headerService: HeaderService) { }

  ngOnInit(): void {
    this.headerService.title.subscribe(title => {
      this.title = title;
    });
  }
  toggleSidenav() {
    this.sidenavService.toggle();

  }
}
