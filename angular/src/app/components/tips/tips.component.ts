import { Component, OnInit } from '@angular/core';
import { TipsService } from 'src/app/services/tips.service';
import { Tip } from 'src/app/models/tip';
import { DomSanitizer } from '@angular/platform-browser';
import { HeaderService } from 'src/app/services/header.service';

@Component({
  selector: 'app-tips',
  templateUrl: './tips.component.html',
  styleUrls: ['./tips.component.scss']
})
export class TipsComponent implements OnInit {
  tips: Tip[];

  constructor(
    private tipsService: TipsService,
    private headerService: HeaderService,
    private sanitizer: DomSanitizer
  ) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Tips');
    });
    this.getTips();
  }

  sanitize(url) {
    return this.sanitizer.bypassSecurityTrustResourceUrl(url);
  }

  getTips() {
    this.tipsService.getTips<Tip[]>().subscribe(res => {
      this.tips = res;
    }, err => {
      console.error(err);
    });
  }

}
