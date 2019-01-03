import { Component, ViewChild, OnInit } from '@angular/core';
import { Router, NavigationStart } from '@angular/router';
import { MatSidenav } from '@angular/material';
import { SidenavService } from './services/sidenav-service.service';
import { AuthService } from './services/auth.service';
import { HeaderService } from './services/header.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = '';
  currentUser: number;

  @ViewChild('sidenav') public sidenav: MatSidenav;
  showHead = false;

  constructor(
    private router: Router,
    private sidenavService: SidenavService,
    private authService: AuthService,
    private headerService: HeaderService
    ) {

  }

  ngOnInit(): void {
    this.router.events.forEach(event => {
      if (event instanceof NavigationStart) {
        if (event['url'] === '/login') {
          this.showHead = false;
        } else if (event['url'] === '/register') {
          this.showHead = false;
        } else {
          this.showHead = true;
        }
      }
    });
    this.sidenavService.setSidenav(this.sidenav);
    this.currentUser = this.authService.getDecodedToken().data.user.id;
    this.router.events.subscribe(event => {
      // close sidenav on routing
      this.sidenavService.close();
    });

  }
}
