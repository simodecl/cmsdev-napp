import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user';
import { HeaderService } from 'src/app/services/header.service';
import { ProfileService } from 'src/app/services/profile.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { TrackingService } from 'src/app/services/tracking.service';
import * as moment from 'moment';

@Component({
  selector: 'app-tracking',
  templateUrl: './tracking.component.html',
  styleUrls: ['./tracking.component.scss']
})
export class TrackingComponent implements OnInit {
  errors: String;
  trackingForm: FormGroup;
  user: User;

  constructor(
    private profileService: ProfileService,
    private fb: FormBuilder,
    private headerService: HeaderService,
    private trackingService: TrackingService
  ) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Slaapgegevens invullen');
    });
    this.trackingForm = this.fb.group({
      startdate: ['', Validators.required],
      starttime: ['', Validators.required],
      enddate: ['', Validators.required],
      endtime: ['', Validators.required],
      deep: [2.5, Validators.required],
      rested: [2.5, Validators.required]
    });
    this.getCurrentUser();
  }

  getCurrentUser() {
    this.profileService.getCurrentUser<User>().subscribe(user => {
      console.log(user);
      this.user = user;
    }, err => {
      console.error(err);
    });
  }

  postTracking() {
    const starttime = this.trackingForm.value.starttime.split(':');
    const startdate = moment(this.trackingForm.value.startdate).add({ hours: starttime[0], minutes: starttime[1]}).format('MM/DD/YYYY h:mm a');
    const endtime = this.trackingForm.value.endtime.split(':');
    const enddate = moment(this.trackingForm.value.enddate).add({ hours: endtime[0], minutes: endtime[1]}).format('MM/DD/YYYY h:mm a');

    const data = {
      'fields': {
        'sleep_start': startdate.toString(),
        'sleep_end': enddate.toString(),
        'sleep_deep': this.trackingForm.value.deep,
        'sleep_rest': this.trackingForm.value.rested
      }
    };
    if (this.trackingForm.valid) {
      if (moment(enddate).isSameOrAfter(startdate)) {
        this.trackingService.postEmptyTracking().subscribe(res => {
          this.trackingService.updateTracking(data, res.id).subscribe(result => {
            console.log(result);
          }, error => {
            console.log(error);
            this.errors = error;
          });
        });
      } else {
        this.errors = 'De einddatum moet na de startdatum plaatsvinden.';
      }
    } else {
      this.errors = 'Je moet alle velden invullen.';
    }
  }

}
