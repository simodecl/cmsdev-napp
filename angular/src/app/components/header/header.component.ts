import { Component, OnInit, ViewChild } from '@angular/core';
import { SidenavService } from 'src/app/services/sidenav-service.service';
import { MatSidenav } from '@angular/material';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {
  constructor(
    private sidenavService: SidenavService) { }

  toggleSidenav() {
    this.sidenavService.toggle();
  }
}
