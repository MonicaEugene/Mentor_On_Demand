import { PipeTransform, Pipe } from '@angular/core';
import { IMentorSkillDetails } from '../Models/IMentorSkillDetails';

@Pipe({
        name:'searchskill'
    })
    export class searchskill implements PipeTransform
    {
        transform(mentorSkills:IMentorSkillDetails[],searchskills:string)
        {
            if(!mentorSkills ||!searchskills)
            {
                return mentorSkills
            }
            return mentorSkills.filter(x=>x.mentorSkillName.toLowerCase().startsWith(searchskills.toLowerCase()));
        }
    } 