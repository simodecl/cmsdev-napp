import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  logoPath = '/assets/napp-logo-light.png';
  loginForm: FormGroup;
  errors: string;
  token: null;

  constructor(
    public authService: AuthService,
    public router: Router,
    private fb: FormBuilder) { }

  ngOnInit() {
    localStorage.removeItem('token');
    this.loginForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required],
    });
  }
  login() {
    const data = {
      username: this.loginForm.value.username,
      password: this.loginForm.value.password,
    };
    this.authService.login(data).subscribe(result => {
      console.log(result);
      localStorage.setItem('token', result.token);
      localStorage.setItem('email', result.email);
      localStorage.setItem('username', result.username);
      localStorage.setItem('displayname', result.displayname);
      this.router.navigate(['']);
    },
    error => {
      if (error.includes('Ongeldige')) {
        this.errors = 'Ongeldige gebruikersnaam';
      } else {
        this.errors = 'Ongeldig wachtwoord';
      }
      console.log(this.errors);
    },
    () => {
      // Route to new page
    });
  }
}
