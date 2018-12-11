import { User } from './user';
import { Media } from './media';

export class Selfie {
  id?: number;
  date: string;
  title: Title;
  author: number;
  featured_media: number;
  hashtag: Array<number>;
  acf: Acf;
  _embedded: Embedded;
}

export class Title {
  rendered: string;
}

export class Acf {
  likes: Array<number>;
}

export class Embedded {
  'wp:featuredmedia': Array<Media>;
  'wp:term': Array<Array<Terms>>;
  author: Array<User>;
}


export class Terms {
  id: number;
  name: string;
  taxonomy: string;
}
