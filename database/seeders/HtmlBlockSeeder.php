<?php

namespace Database\Seeders;

use App\Models\Content\HtmlBlock;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class HtmlBlockSeeder extends Seeder
{
    use TruncateTable, DisableForeignKeys;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $this->truncate('html_blocks');

        $blocks = [
            [
                'admin_title' => 'Баннер на главной',
                'section' => 'home_banner',
                'slug' => 'home_banner',
                'title_ru' => 'ЗАГОЛОВОК БАННЕРА<br> БУДЕТ ТУТ',
                'title_en' => 'BANNER HEADER<br>WILL BE HERE',
                'description_ru' => '',
                'description_en' => '',
            ],
            [
                'admin_title' => 'Вступление на главной',
                'section' => 'introduction',
                'slug' => 'introduction',
                'title_ru' => '<small>Вступление</small><span>О платформе</span>',
                'title_en' => '<small>Introduction</small><span>About the platform</span>',
                'description_ru' => $this->introductionRu(),
                'description_en' => $this->introductionEn(),
            ],
            [
                'admin_title' => 'Как это работает, кандидат, регистрация',
                'section' => 'process',
                'image' => asset('/images/rezume.png'),
                'slug' => 'candidate_registration',
                'title_ru' => 'Регистрация<br> на jobzz.ru',
                'title_en' => 'Registration<br> on jobzz.ru',
                'description_ru' => $this->loremShort(),
                'description_en' => $this->loremShort(),
            ],
            [
                'admin_title' => 'Как это работает, кандидат, публикация',
                'section' => 'process',
                'image' => asset('/images/head.png'),
                'slug' => 'candidate_publishing',
                'title_ru' => 'Публикация<br>вашего профиля',
                'title_en' => 'Publishing<br>your profile',
                'description_ru' => $this->loremShort(),
                'description_en' => $this->loremShort(),
            ],
            [
                'admin_title' => 'Как это работает, кандидат, предложение',
                'section' => 'process',
                'image' => asset('/images/comp.png'),
                'slug' => 'candidate_offers',
                'title_ru' => 'Предложения<br>о работе',
                'title_en' => 'Job<br>offers',
                'description_ru' => $this->loremShort(),
                'description_en' => $this->loremShort(),
            ],
            [
                'admin_title' => 'Как это работает, кандидат, работа',
                'section' => 'process',
                'image' => asset('/images/hand.png'),
                'slug' => 'candidate_job',
                'title_ru' => 'Ваша<br>новая работа',
                'title_en' => 'Your<br>new job',
                'description_ru' => $this->loremShort(),
                'description_en' => $this->loremShort(),
            ],


            [
                'admin_title' => 'Как это работает, рекрутер, регистрация',
                'section' => 'process',
                'image' => asset('/images/rezume.png'),
                'slug' => 'recruiter_registration',
                'title_ru' => 'Регистрация<br> на jobzz.ru',
                'title_en' => 'Registration<br> on jobzz.ru',
                'description_ru' => $this->loremShort(),
                'description_en' => $this->loremShort(),
            ],
            [
                'admin_title' => 'Как это работает, рекрутер, вакансия',
                'section' => 'process',
                'image' => asset('/images/comp.png'),
                'slug' => 'recruiter_vacancy',
                'title_ru' => 'Размещение<br>вакансии',
                'title_en' => 'Posting<br>vacancies',
                'description_ru' => $this->loremShort(),
                'description_en' => $this->loremShort(),
            ],
            [
                'admin_title' => 'Как это работает, рекрутер, поиск',
                'section' => 'process',
                'image' => asset('/images/head.png'),
                'slug' => 'recruiter_search',
                'title_ru' => 'Поиск<br>кандидатов',
                'title_en' => 'Search<br>for candidates',
                'description_ru' => $this->loremShort(),
                'description_en' => $this->loremShort(),
            ],
            [
                'admin_title' => 'Как это работает, рекрутер, работа',
                'section' => 'process',
                'image' => asset('/images/hand.png'),
                'slug' => 'recruiter_offer',
                'title_ru' => 'Наем<br>сотрудника',
                'title_en' => 'Hiring<br>n employee',
                'description_ru' => $this->loremShort(),
                'description_en' => $this->loremShort(),
            ],


            [
                'admin_title' => 'Блок о сотрудничестве',
                'section' => 'cooperation',
                'slug' => 'cooperation_text',
                'title_ru' => 'Готовы<br>сотрудничать?',
                'title_en' => 'Are you ready<br> to cooperate?',
                'description_ru' => $this->loremFull(),
                'description_en' => $this->loremFull(),
            ],

            [
                'admin_title' => 'Текст в футере',
                'section' => 'footer',
                'slug' => 'footer_text',
                'title_ru' => '',
                'title_en' => '',
                'description_ru' => 'Jobzz.ru - портал для анонимного поиска работы в IT сфере',
                'description_en' => 'Jobzz.ru - a portal for anonymous job search in the IT field',
            ],

            [
                'admin_title' => 'Удаление аккаунта',
                'section' => 'footer',
                'slug' => 'account_delete',
                'title_ru' => 'Вы уверены, что хотите удалить свою учетную запись?',
                'title_en' => 'Are you sure you want to delete your account?',
                'description_ru' => 'После удаления, аккаунт невозможно будет восстановить. При удалении этого аккаунта вы сможете создать абсолютно новый аккаунт даже с той же самой почтой. Работодатели, с которыми вы общались ранее, об этом не узнают и ваши контакты будут для них снова скрыты = поиск на Jobzz с чистого листа :)',
                'description_en' => 'Once deleted, the account cannot be restored. By deleting this account, you will be able to create a completely new account even with the same mail. Employers with whom you spoke earlier will not be aware of this and your contacts will be hidden for them again = search on Jobzz from scratch :)',
            ],
            [
                'admin_title' => 'Маркетинговый слоган про компанию',
                'section' => 'footer',
                'slug' => 'marketing-slogan',
                'title_ru' => 'Маркетинговый слоган про компанию',
                'title_en' => 'Marketing slogan about the company',
            ],
        ];


        foreach ($blocks as $block) {
            HtmlBlock::create($block);
        }

    }


    private function introductionRu()
    {
        return '<p>Jobzz.ru - это портал для анонимного поиска работы в IT сфере.</p>
<p>Вы можете вести как активный поиск (вы откликаетесь на размещенные вакансии), так и пассивный (вы публикуете свой профиль и получаете предложения от работодателей).</p>
<p>Если вы опубликуете свой профиль, рекрутеры будут видеть только ваши проф навыки, все ваши контактные данные, резюме и фотография будут скрыты.
Вы сами выбираете кому открыть свои контакты и с кем продолжить общение.
Ни один рекрутер, без вашего согласия, не сможет узнать ваш номер мобильного, почту или имя.
Таким образом поиск работы будет удобным и анонимным.</p>';
    }

    private function introductionEn()
    {
        return '<p>Jobzz.ru is a portal for anonymous job search in the IT field.</p>
<p>You can conduct an active search (you respond to posted vacancies) or passive (you publish your profile and receive offers from employers).</p>
<p>If you publish your profile, recruiters will only see your professional skills, all your contact details, resume and photo will be hidden.
You yourself choose who to open your contacts and with whom to continue communication.
No recruiter, without your consent, will be able to find out your mobile number, mail or name.
Thus, job search will be convenient and anonymous.</p>';
    }

    private function loremShort()
    {
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt';
    }

    private function loremFull()
    {
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip';
    }
}
