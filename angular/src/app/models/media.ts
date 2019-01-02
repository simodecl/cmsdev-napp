export class Media {
  id: number;
  author: number;
  media_details: MediaDetails;
  title: Rendered;
  caption: Rendered;
}

export class Rendered {
  rendered: String;
}

export class MediaDetails {
  sizes: Sizes;
}

export class Sizes {
  thumbnail: SizeURL;
  medium: SizeURL;
  medium_large: SizeURL;
  large: SizeURL;
}

export class SizeURL {
  source_url: string;
}
