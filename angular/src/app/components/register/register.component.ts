import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  logoPath = '/assets/napp-logo-blue.png';
  username: '';
  email: '';
  password: '';
  password2: '';
  errors;
  token: null;

  constructor(
    public authService: AuthService,
    public router: Router) { }

  ngOnInit() {
    localStorage.clear();
  }
  register() {
    const data = {
      username: this.username,
      email: this.email,
      password: this.password,
    };
    const urlParameters = Object.entries(data).map(e => e.join('=')).join('&');

    if (this.password === this.password2) {
      this.authService.register(urlParameters).subscribe(result => {
        // Handle result
        console.log(result);
        this.router.navigate(['login']);
      },
      error => {
        this.errors = error;
        console.log(this.errors);
      },
      () => {
        // Route to new page
      });
    } else {
      this.errors = 'De wachtwoorden komen niet overeen';
      console.log(this.errors);
    }

  }
}
