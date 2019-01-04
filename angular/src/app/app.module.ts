import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms'; // <-- NgModel lives here
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { HttpModule } from '@angular/http';
import { MomentModule } from 'ngx-moment';

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
import { SelfieDetailComponent } from './components/home/selfie-detail/selfie-detail.component';
import { SelfieCreateComponent } from './components/home/selfie-create/selfie-create.component';
import { TipsComponent } from './components/tips/tips.component';
import { QuizComponent } from './components/quiz/quiz.component';
import { TrackingComponent } from './components/tracking/tracking.component';
import { StatsComponent } from './components/stats/stats.component';
import { SelfieHashtagComponent } from './components/home/selfie-hashtag/selfie-hashtag.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    HomeComponent,
    HeaderComponent,
    ProfilesComponent,
    ProfileDetailComponent,
    ProfileSettingsComponent,
    SelfieDetailComponent,
    SelfieCreateComponent,
    TipsComponent,
    QuizComponent,
    TrackingComponent,
    StatsComponent,
    SelfieHashtagComponent
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
    ReactiveFormsModule,
    MomentModule
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
