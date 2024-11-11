export interface degreeInterface {
  best_match: number;
  credits: number | string;
  degrees: { fi: string[] };
  description: { fi: string };
  field: { fi: string };
  id: string;
  keywords: string[];
  level: { fi: string };
  match_count: number;
  name: { fi: string };
  organizations: string[];
  organization_aliases: string[];
  organizations_count: number;
  tutkinnonosat: string[];
  url: string;
  validated: boolean;
}
