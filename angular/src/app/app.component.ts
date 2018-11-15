import { Component, ViewChild, OnInit } from '@angular/core';
import { Router, NavigationStart } from '@angular/router';
import { MatSidenav } from '@angular/material';
import { SidenavService } from './services/sidenav-service.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'napp';

  @ViewChild('sidenav') public sidenav: MatSidenav;
  showHead = false;

  constructor(
    private router: Router,
    private sidenavService: SidenavService
    ) {
    router.events.forEach(event => {
      if (event instanceof NavigationStart) {
        if (event['url'] === '/login') {
          this.showHead = false;
        } else {
          this.showHead = true;
        }
      }
    });
  }

  ngOnInit(): void {
    this.sidenavService.setSidenav(this.sidenav);
    console.log(this.sidenav);
  }
}
