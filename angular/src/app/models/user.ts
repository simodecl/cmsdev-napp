export class User {
  id?: number;
  username: string;
  password: string;
  firstname: string;
  lastname: string;
  displayname: string;
  meta: Meta;
}

export class Meta {
  avatar: string;
  school: string;
  goal: Goal;
}

export class Goal {
  date: string;
  amount: number;
}
