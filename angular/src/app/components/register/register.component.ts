import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { Router } from '@angular/router';
import { ProfileService } from 'src/app/services/profile.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  logoPath = '/assets/napp-logo-blue.png';
  username: '';
  firstname: '';
  lastname: '';
  email: '';
  password: '';
  password2: '';
  errors;
  token: null;

  constructor(
    public authService: AuthService,
    public router: Router) { }

  ngOnInit() {
    localStorage.removeItem('token');
  }
  register() {
    const data = {
      username: this.username,
      firstname: this.firstname,
      lastname: this.lastname,
      email: this.email,
      password: this.password,
    };

    if (this.password === this.password2) {
      console.log(data);
      this.authService.register(data).subscribe(result => {
        // Handle result
        console.log(result);
        this.router.navigate(['login']);
      },
      error => {
        this.errors = error;
        console.log(this.errors);
      });
    } else {
      this.errors = 'De wachtwoorden komen niet overeen';
      console.log(this.errors);
    }

  }
}
