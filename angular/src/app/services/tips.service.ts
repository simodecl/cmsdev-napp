import { catchError } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class TipsService {
  errors: String;

  constructor(private http: HttpClient) { }

  public getTips<T>(): Observable<T> {
    return this.http.get<T>(`${environment.apiURL}/tips`)
    .pipe(
      catchError(this.handleError)
    );
  }

  public getTextTips<T>(): Observable<T> {
    return this.http.get<T>(`${environment.apiURL}/tips?type=24`)
    .pipe(
      catchError(this.handleError)
    );
  }

  private handleError(errorResponse: HttpErrorResponse) {
    if (errorResponse.error instanceof ErrorEvent) {
      console.error('Client side error: ', errorResponse.error.message);
      this.errors = errorResponse.error.message;
    } else {
      console.error('Server side error: ', errorResponse);
      this.errors = errorResponse.error.message;
    }

    return throwError(this.errors);
  }
}
