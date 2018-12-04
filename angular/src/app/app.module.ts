import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms'; // <-- NgModel lives here
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { HomeComponent } from './components/home/home.component';
import { AppRoutingModule } from './modules/app-routing/app-routing.module';
import { HeaderComponent } from './components/header/header.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { MaterialModule } from './modules/material/material.module';
import { SidenavService } from './services/sidenav-service.service';
import { AuthGuardService } from './services/auth-guard.service';
import { ProfilesComponent } from './components/profiles/profiles.component';
import { ProfileDetailComponent } from './components/profiles/profile-detail/profile-detail.component';
import { ProfileSettingsComponent } from './components/profiles/profile-settings/profile-settings.component';
import { TokenService } from './interceptor/token.service';
import { MAT_DATE_LOCALE } from '@angular/material';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    HomeComponent,
    HeaderComponent,
    ProfilesComponent,
    ProfileDetailComponent,
    ProfileSettingsComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    HttpModule,
    BrowserAnimationsModule,
    MaterialModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [
    SidenavService,
    AuthGuardService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenService,
      multi: true
    },
    // {
    //   provide: MAT_DATE_LOCALE,
    //   useValue: 'nl-BE'
    // },
  ],

  bootstrap: [AppComponent]
})
export class AppModule { }
