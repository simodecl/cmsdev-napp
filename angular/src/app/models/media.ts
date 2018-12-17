export class Media {
  id: number;
  author: number;
  media_details: MediaDetails;
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
  soure_url: string;
}
