import { Component, OnInit } from '@angular/core';
import { HeaderService } from 'src/app/services/header.service';

@Component({
  selector: 'app-quiz',
  templateUrl: './quiz.component.html',
  styleUrls: ['./quiz.component.scss']
})
export class QuizComponent implements OnInit {
  questions = [
    {
      id: 1,
      name: 'q1',
      content: 'Slaap...',
      options: [
        {
          value: 3,
          content: 'I <3 it',
          advice: 'Terecht dat je gek bent op slaap! Slaap is de max. Bovendien heeft het een hele hoop voordelen voor je! Je kan je beter concentreren, hebt een beter humeur, je bent weerbaarder tegen ziektes,… Bovendien leef je op termijn ook gezonder! Slaaptekort verhoogt namelijk je kansen op het krijgen van diabetes, overgewicht en hartziektes op latere leeftijd. Sleep on!',
        },
        {
          value: 2,
          content: 'is nodig, maar heb er niet altijd even veel zin in…',
          advice: 'Voldoende slaap heeft een hele hoop voordelen heeft voor je! Je kan je beter concentreren, hebt een beter humeur, je bent weerbaarder tegen ziektes,… Bovendien leef je op termijn ook gezonder! Slaaptekort verhoogt namelijk je kansen op het krijgen van diabetes, overgewicht en hartziektes op latere leeftijd. Sleep on!',
        },
        {
          value: 1,
          content: 'Zo nutteloos, ik doe liever iets anders!',
          advice: 'Denk er aan dat voldoende slaap een hele hoop voordelen heeft voor je! Je kan je beter concentreren, hebt een beter humeur, je bent weerbaarder tegen ziektes,… Bovendien leef je op termijn ook gezonder! Slaaptekort verhoogt namelijk je kansen op het krijgen van diabetes, overgewicht en hartziektes op latere leeftijd. Try it!',
        },
      ]
    },
    {
      id: 2,
      name: 'q2',
      content: 'Lang uitslapen in het weekend…',
      options: [
        {
          value: 1,
          content: 'Sowiesooooo! Mij zie je voor 10u niet verschijnen!',
          advice: 'Uitslapen is fijn, dat weet iedereen… toch is het jammer genoeg niet zo goed voor je slaappatroon, je brengt het namelijk helemaal in de war waardoor je daarna terug moeilijker kan inslapen. Bovendien zijn de uren die je in de voormiddag bijslaapt, vaak niet zo productief; je lichaam is immers al in ‘dagmodus’ waardoor je enkel licht slaapt. Die lichte slaap zorgt ervoor dat je vaak een stuk groggy-er wakker wordt! Probeer in het weekend niet langer dan 2 uren later op te staan dan het uur waarop je tijdens de week opstaat.  ',
        },
        {
          value: 3,
          content: 'Is voor mij niet langer dan 9u-9u30.',
          advice: 'Uitslapen is fijn, dat weet iedereen… toch is het goed om je slaappatroon zo regelmatig mogelijk te houden. Uitslapen zorgt er immers voor dat dit patroon in de war geraakt en je ’s avonds moeilijker in slaapt valt. Bovendien zijn de uren die je in de voormiddag bijslaapt, vaak niet zo productief; je lichaam is immers al in ‘dagmodus’ waardoor je enkel licht slaapt.',
        },
        {
          value: 2,
          content: 'Hoeft niet, ik word wakker op mijn vast uur!',
          advice: 'Super dat je steeds op regelmatige tijdstippen opstaat, houden zo! Regelmaat zorgt er voor dat je steeds makkelijk kan inslapen. ',
        },
      ]
    },
    {
      id: 3,
      name: 'q3',
      content: 'Slaap jij makkelijk in?',
      options: [
        {
          value: 2,
          content: 'Ik slaap relatief snel in',
          advice: 'Voor je gaat slapen is het belangrijk dat je lichaam tot rust komt. Een slaapritueel kan hierbij helpen: het geeft immers het signaal aan je lichaam dat het tijd is om rustig te worden!',
        },
        {
          value: 1,
          content: 'Ik lig vaak nog lang te woelen en piekeren',
          advice: 'Terecht dat je gek bent op slaap! Slaap is de max. Bovendien heeft het een hele hoop voordelen voor je! Je kan je beter concentreren, hebt een beter humeur, je bent weerbaarder tegen ziektes,… Bovendien leef je op termijn ook gezonder! Slaaptekort verhoogt namelijk je kansen op het krijgen van diabetes, overgewicht en hartziektes op latere leeftijd. Sleep on!',
        },
        {
          value: 3,
          content: 'Ik slaap vrijwel meteen in',
          advice: '',
        },
      ]
    },
    {
      id: 4,
      name: 'q4',
      content: 'Ochtendmodus',
      options: [
        {
          value: 1,
          content: 'Zombie',
          advice: 'Wanneer je je ’s ochtends een echte zombie voelt is de kans groot dat je te weinig slaapt. Probeer er wat vroeger in te kruipen!'
        },
        {
          value: 3,
          content: 'Fris als een vis',
          advice: '',
        },
        {
          value: 2,
          content: 'Groggy maar gaat snel over',
          advice: '',
        },
      ]
    },
    {
      id: 5,
      name: 'q5',
      content: 'Overdag',
      options: [
        {
          value: 1,
          content: 'Blijf ik gewoon de hele dag door geeuwen',
          advice: 'Wanneer je je overdag steeds vermoeid voelt en op elk moment zou kunnen slapen, wijst dit er op dat je te weinig slaapt. Probeer wat meer slaap te halen!',
        },
        {
          value: 2,
          content: 'Kom ik er tegen de middag wel door',
          advice: '',
        },
        {
          value: 3,
          content: 'Wordt ik tegen de avond goed moe',
          advice: '',
        },
      ]
    },
    {
      id: 6,
      name: 'q6',
      content: 'Screen addict or angel?',
      options: [
        {
          value: 1,
          content: '#Gamingislife, #Netflix en #FOMO: no way dat ik iets mis, mijn GSM is mijn vaste bed-buddy',
          advice: 'Denk er aan dat schermgebruik ’s avonds af te raden is om verschillende redenen: 1) het blauwe licht van je scherm zorgt ervoor dat de aanmaak van het slaaphormoon geremd wordt, waardoor je moeilijker inslaapt en minder diep slaapt.  2) het is verslavend, het houdt je langer wakker dan nodig 3) het geeft je enorm veel extra prikkels, waardoor je niet tot rust kan komen om te slapen. ',
        },
        {
          value: 3,
          content: '#nophone: Mijn GSM komt mijn kamer niet in!',
          advice: '',
        },
        {
          value: 2,
          content: '#SMART-phone: mijn GSM/scherm ligt in mijn kamer, maar ik gebruik hem niet meer of beperkt.',
          advice: 'Super dat je verstandig om gaat met schermen ’s avonds. Is het soms moeilijk om aan de verleiding te weerstaan? Zorg dat je schermen buiten handbereik liggen! Nog beter is ze buiten je kamer leggen natuurlijk',
        },
      ]
    },
];

  constructor(
    private headerService: HeaderService,
    ) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Quiz');
    });
  }

}
