import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { User } from 'src/app/models/user';
import { TrackingService } from 'src/app/services/tracking.service';
import { ProfileService } from 'src/app/services/profile.service';
import { HeaderService } from 'src/app/services/header.service';
import { Tracking } from 'src/app/models/tracking';
import * as moment from 'moment';
import { Chart } from 'chart.js';
import { Tip } from 'src/app/models/tip';
import { TipsService } from 'src/app/services/tips.service';

@Component({
  selector: 'app-stats',
  templateUrl: './stats.component.html',
  styleUrls: ['./stats.component.scss']
})
export class StatsComponent implements OnInit {
  errors: String;
  user: User;
  dates = [];
  amounts = [];
  deeps = [];
  rests = [];
  amountchart = [];
  deepchart = [];
  restchart = [];
  tips: Tip[];
  deepTip: String;
  restTip: String;

  @ViewChild('chartAmount') amountRef: ElementRef;
  @ViewChild('chartDeep') deepRef: ElementRef;
  @ViewChild('chartRest') restRef: ElementRef;

  constructor(
    private profileService: ProfileService,
    private headerService: HeaderService,
    private trackingService: TrackingService,
    private tipsService: TipsService
  ) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Slaapstatistieken');
    });
    this.editChartConfig();
    this.getTips();
    this.getUserAndTrackings();
  }

  getUserAndTrackings() {
    this.profileService.getCurrentUser<User>().subscribe(user => {
      console.log(user);
      this.user = user;
      this.getTrackings();
    }, err => {
      console.error(err);
    });
  }

  getTips() {
    this.tipsService.getTextTips<Tip[]>().subscribe((tips: Tip[]) => {
      console.log(tips);
      this.tips = tips;
    }, err => {
      console.error(err);
    });
  }

  getTrackings() {
    this.trackingService.getTrackingsByUser<Tracking[]>(this.user.id).subscribe((trackings: Tracking[]) => {
      trackings.forEach(tracking => {
        this.dates.unshift(moment(tracking.acf.sleep_end, 'DD/MM/YYYY h:mm a').locale('nl-be').format('ll'));
        this.amounts.unshift(moment.duration(moment(tracking.acf.sleep_end, 'DD/MM/YYYY h:mm a').diff(moment(tracking.acf.sleep_start, 'DD/MM/YYYY h:mm a'))).asHours());
        this.deeps.unshift(+tracking.acf.sleep_deep);
        this.rests.unshift(+tracking.acf.sleep_rest);
      });
      if ( this.dates.length > 1 && this.deeps.length > 1 && this.rests.length > 1 ) {
        let deepAvg = this.deeps.reduce((previous, current) => current += previous);
        deepAvg = deepAvg / this.deeps.length;
        console.log(deepAvg);
        if (deepAvg < 3.75) { this.deepTip = this.tips[Math.floor(Math.random() * this.tips.length)].acf.text; }

        let restAvg = this.rests.reduce((previous, current) => current += previous);
        restAvg = restAvg / this.deeps.length;
        console.log(restAvg);
        if (restAvg < 3.75) { this.restTip = this.tips[Math.floor(Math.random() * this.tips.length)].acf.text; }
        const ctx = this.amountRef.nativeElement.getContext('2d');
        const ctxDeep = this.deepRef.nativeElement.getContext('2d');
        const ctxRest = this.restRef.nativeElement.getContext('2d');
        this.amountchart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: this.dates,
            datasets: [
              {
                data: this.amounts,
                borderColor: '#4D648D',
                fill: false
              }
            ]
          },
          options: {
            legend: {
              display: false,
            },
            scales: {
              xAxes: [{
                display: true,
                ticks: {
                  fontColor: '#4D648D'
              },
              }],
              yAxes: [{
                display: true,
                ticks: {
                  beginAtZero: true,
                  fontColor: '#4D648D',
                  callback: function(label, index, labels) {
                    return label + ' uur';
                }
              },
              }],
            }
          }
        });
        this.deepchart = new Chart(ctxDeep, {
          type: 'doughnut',
          data: {
            labels: ['Gemiddelde Uitgerustheid'],
            datasets: [
              {
                data: [deepAvg, 5 - deepAvg],
                backgroundColor: ['#4D648D', '#D0E1F9'],
                borderColor: '#4D648D',
                fill: false
              }
            ]
          },
          options: {
            legend: {
              display: false,
            },
            elements: {
                center: {
                text: Math.round( deepAvg * 10 ) / 10,
                color: '#4D648D', // Default black
                sidePadding: 50 // Default 20 (as a percentage)
              }
            }
          }
        });
        this.restchart = new Chart(ctxRest, {
          type: 'doughnut',
          data: {
            labels: ['Gemiddelde slaapdiepte'],
            datasets: [
              {
                data: [restAvg, 5 - restAvg],
                backgroundColor: ['#283655', '#D0E1F9'],
                borderColor: '#283655',
                fill: false
              }
            ]
          },
          options: {
            legend: {
              display: false,
            },
            elements: {
                center: {
                text: Math.round( restAvg * 10 ) / 10,
                color: '#4D648D', // Default black
                sidePadding: 50 // Default 20 (as a percentage)
              }
            }
          }
        });
      }
    }, err => {
      console.error(err);
    });
  }

  editChartConfig() {
    Chart.pluginService.register({
      beforeDraw: function (chart) {
        if (chart.config.options.elements.center) {
          // Get ctx from string
          const ctx = chart.chart.ctx;

          // Get options from the center object in options
          const centerConfig = chart.config.options.elements.center;
          const fontStyle = centerConfig.fontStyle || 'Open Sans';
          const txt = centerConfig.text;
          const color = centerConfig.color || '#000';
          const sidePadding = centerConfig.sidePadding || 20;
          const sidePaddingCalculated = (sidePadding / 100) * (chart.innerRadius * 2);
          // Start with a base font of 30px
          ctx.font = '30px ' + fontStyle;

          // Get the width of the string and also the width of the element minus 10 to give it 5px side padding
          const stringWidth = ctx.measureText(txt).width;
          const elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

          // Find out how much the font can grow in width.
          const widthRatio = elementWidth / stringWidth;
          const newFontSize = Math.floor(30 * widthRatio);
          const elementHeight = (chart.innerRadius * 2);

          // Pick a new font size so it will not be larger than the height of label.
          const fontSizeToUse = Math.min(newFontSize, elementHeight);

          // Set font settings to draw it correctly.
          ctx.textAlign = 'center';
          ctx.textBaseline = 'middle';
          const centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
          const centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
          ctx.font = fontSizeToUse + 'px ' + fontStyle;
          ctx.fillStyle = color;

          // Draw text in center
          ctx.fillText(txt, centerX, centerY);
        }
      }
    });
  }
}
