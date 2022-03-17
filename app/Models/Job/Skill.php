<?php

namespace App\Models\Job;

use App\Models\Traits\HasLocalizedTitle;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

/**
 * Class Skill
 *
 * @package App\Models\Job
 * @mixin IdeHelperSkill
 */
class Skill extends Model
{
    use HasLocalizedTitle;
    use Sluggable;

    protected $fillable = [
        'title_en',
        'title_ru',
        'slug',
        'popular',
        'is_custom',
    ];

    protected $appends = [
        'title',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public static function findByTitle($title, $create = false)
    {
        $title = trim($title);
        if (!empty($title)) {
            $skill = Skill::where('title_ru', 'LIKE', $title)->orWhere('title_en', 'LIKE', $title)->first();
            if ($skill === null && $create) {
                $skill = new Skill();
                $skill->is_custom = 1;
                $skill->title_ru = $title;
                $skill->title_en = $title;
                $skill->popular = 0;
                $skill->save();
            }
            return $skill;
        }
        return null;
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title_en',
            ],
        ];
    }

    /**
     * Вакансий
     *
     * @return BelongsToMany
     */
    public function vacancies()
    {
        return $this->belongsToMany(Vacancy::class, 'vacancy_skills');
    }

    /**
     * Кандидаты
     *
     * @return BelongsToMany
     */
    public function candidates()
    {
        return $this->belongsToMany(CandidateProfile::class, 'candidate_skills', 'skill_id', 'profile_id');
    }

    /**
     * Специализации
     *
     * @return BelongsToMany
     */
    public function specializations()
    {
        return $this->belongsToMany(Specialization::class, 'specializations_skills');
    }
}
