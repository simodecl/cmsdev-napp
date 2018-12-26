import { User } from './user';

export class Comment {
  id?: number;
  post: number;
  content: Rendered;
  parent: number;
  _embedded: Embedded;
}

export class Embedded {
  author: Array<User>;
}

export class Rendered {
  rendered: string;
}
