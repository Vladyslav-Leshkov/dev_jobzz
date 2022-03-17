<?php

namespace Database\Seeders;

use App\Models\Common\SiteOption;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class SiteOptionSeeder extends Seeder
{
    use TruncateTable, DisableForeignKeys;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->disableForeignKeys();
        //
        $this->truncate('site_options');

        $site_options = [
            ['key' => 'contact_email', 'value' => 'leshkov.vladislav@gmail.com', 'title' => 'Контактный E-mail', 'primary' => true],
            ['key' => 'contact_phone1', 'value' => '+7 (980) 387 30 52', 'title' => 'Контактный телефон 1', 'primary' => true],
            ['key' => 'contact_phone2', 'value' => '', 'title' => 'Контактный телефон 2', 'primary' => true],
            ['key' => 'contact_phone3', 'value' => '', 'title' => 'Контактный телефон 3', 'primary' => true],
            ['key' => 'telegram', 'value' => 'https://t.me/VladislavLeshkov', 'title' => 'Telegram', 'primary' => true],
            ['key' => 'linked_in', 'value' => 'https://www.linkedin.com/in/vladislav-leshkov/', 'title' => 'LinkedIn', 'primary' => true],
            ['key' => 'instagram', 'value' => '#', 'title' => 'Instagram', 'primary' => true],
            ['key' => 'facebook', 'value' => '#', 'title' => 'Facebook', 'primary' => true],
            ['key' => 'google_play', 'value' => '#', 'title' => 'Google Play', 'primary' => true],
            ['key' => 'app_store', 'value' => '#', 'title' => 'App Store', 'primary' => true],
            ['key' => 'moderate_candidate', 'value' => false, 'title' => 'Модерация кандидатов', 'primary' => true, 'type' => 'boolean'],
            ['key' => 'moderate_recruiter', 'value' => true, 'title' => 'Модерация рекрутеров', 'primary' => true, 'type' => 'boolean'],
            ['key' => 'candidate_price_percent', 'value' => 10, 'title' => 'Стоимость кандидатов, %', 'primary' => true],
            ['key' => 'candidate_price_min', 'value' => 1000, 'title' => 'Мин. стоимость кандидатов, руб.', 'primary' => true],
            ['key' => 'candidate_pay_min', 'value' => 50000, 'title' => 'Порог оплаты кандидатов, руб.', 'primary' => true],
            [
                'key' => 'candidate_offer_text',
                'value' => $this->candidateOfferText(),
                'title' => 'Текст предложение кандидату',
                'primary' => true,
                'type' => 'text',
            ],
            [
                'key' => 'vacancy_offer_text',
                'value' => $this->vacancyOfferText(),
                'title' => 'Текст отклик на вакансию',
                'primary' => true,
                'type' => 'text',
            ],
            [
                'key' => 'vacancy_regards_text',
                'value' => $this->vacancyRegardsText(),
                'title' => 'Текст подписи отклика на вакансию',
                'primary' => true,
                'type' => 'text',
            ],
            // реквизиты для Рублевы платежей

            [
                'key' => 'invoice_offer_rub',
                'value' => 'Услуги в сфере поиска и подбора персонала',
                'title' => 'Название позиции в счете, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_name_rub',
                'value' => 'ИП ЛЕШКОВ ВЛАДИСЛАВ АЛЕКСАНДРОВИЧ',
                'title' => 'Название организации, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_inn_rub',
                'value' => '312348651842',
                'title' => 'ИНН, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_address_rub',
                'value' => '308018, РОССИЯ, БЕЛГОРОДСКАЯ ОБЛ, Г БЕЛГОРОД, УЛ ЛУНАЧАРСКОГО, Д 22',
                'title' => 'Юридический адрес организации, RUB',
                'primary' => true,
            ],
            [
                'key' => 'beneficiary_account_rub',
                'value' => '40802810200002449705',
                'title' => 'Расчетный счет, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_ogrn_rub',
                'value' => '321312300048189',
                'title' => 'ОГРН, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_bank_rub',
                'value' => 'АО «Тинькофф Банк»',
                'title' => 'Банк, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_bank_bik_rub',
                'value' => '044525974',
                'title' => 'БИК банка, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_bank_inn_rub',
                'value' => '7710140679',
                'title' => 'ИНН банка, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_bank_account_rub',
                'value' => '30101810145250000974',
                'title' => 'Корреспондентский счет банка, RUB',
                'primary' => true,
            ],
            [
                'key' => 'invoice_bank_address_rub',
                'value' => '127287, г. Москва, ул. Хуторская 2-я, д. 38А, стр. 26',
                'title' => 'Юридический адрес банка, RUB',
                'primary' => true,
            ],

            // реквизиты для SWIFT платежей
            [
                'key' => 'invoice_offer_swift',
                'value' => 'Services in the area of personnel search and selection',
                'title' => 'Название позиции в счете, SWIFT',
                'primary' => true,
            ],

            [
                'key' => 'beneficiary',
                'value' => 'PE LESHKOV VLADISLAV ALEKSANDROVICH',
                'title' => 'Beneficiary, SWIFT',
                'primary' => true,
            ],
            [
                'key' => 'beneficiary_address',
                'value' => '308018, LUNACHARSKOGO STREET, HSE 22, BELGOROD, RUSSIA',
                'title' => 'Beneficiary address, SWIFT',
                'primary' => true,
            ],
            [
                'key' => 'beneficiary_bank',
                'value' => 'Tinkoff Bank',
                'title' => 'Beneficiary\'s bank, SWIFT',
                'primary' => true,
            ],
            [
                'key' => 'beneficiary_bank_address',
                'value' => '38A, BLD. 26, 2 KHUTORSKAYA STREET, MOSCOW, 127287',
                'title' => 'Beneficiary\'s bank address, SWIFT',
                'primary' => true,
            ],

            // реквизиты долларового счета
            [
                'key' => 'beneficiary_account_usd',
                'value' => '40802840310000029896',
                'title' => 'Beneficiary account, USD',
                'primary' => true,
            ],
            [
                'key' => 'beneficiary_transit_account_usd',
                'value' => '40802840420000029896',
                'title' => 'Beneficiary transit account, USD',
                'primary' => true,
            ],
            [
                'key' => 'beneficiary_swift_usd',
                'value' => 'TICSRUMMXXX',
                'title' => 'Beneficiary SWIFT, USD',
                'primary' => true,
            ],

            [
                'key' => 'intermediary_usd',
                'value' => 'JPMORGAN CHASE BANK, N.A. NEW YORK, NY US',
                'title' => 'Intermediary, USD',
                'primary' => true,
            ],
            [
                'key' => 'intermediary_swift_usd',
                'value' => 'CHASUS33XXX',
                'title' => 'Intermediary SWIFT, USD',
                'primary' => true,
            ],
            [
                'key' => 'intermediary_account_usd',
                'value' => '464650808',
                'title' => 'Intermediary\'s account, USD',
                'primary' => true,
            ],

            // Реквизиты для оплаты евро

            [
                'key' => 'beneficiary_account_eur',
                'value' => '40802978000000018788',
                'title' => 'Beneficiary account, EUR',
                'primary' => true,
            ],
            [
                'key' => 'beneficiary_transit_account_eur',
                'value' => '40802978220000018788',
                'title' => 'Beneficiary transit account, EUR',
                'primary' => true,
            ],
            [
                'key' => 'beneficiary_swift_eur',
                'value' => 'TICSRUMMXXX',
                'title' => 'Beneficiary SWIFT, EUR',
                'primary' => true,
            ],
            [
                'key' => 'intermediary_eur',
                'value' => 'J.P.MORGAN AG FRANKFURT AM MAIN, DE',
                'title' => 'Intermediary, EUR',
                'primary' => true,
            ],
            [
                'key' => 'intermediary_swift_eur',
                'value' => 'CHASDEFXXXX',
                'title' => 'Intermediary SWIFT, EUR',
                'primary' => true,
            ],
            [
                'key' => 'intermediary_account_eur',
                'value' => '6231608701',
                'title' => 'Intermediary\'s account, EUR',
                'primary' => true,
            ],
        ];

        foreach ($site_options as $option) {
            SiteOption::createOption($option['key'], $option['value'], $option['title'], $option['primary'] ?? false, $option['type'] ?? null);

        }
        SiteOption::clearCache();
        $this->enableForeignKeys();
    }

    private function candidateOfferText(): string
    {
        return "Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)";
    }

    private function vacancyOfferText(): string
    {
        return "
Добрый день! {RECRUITER_NAME}
Мне интересна ваша вакансия {VACANCY_TITLE}
{VACANCY_URL}

Открываю свои контакты и резюме
{CANDIDATE_CONTACT}
С нетерпением буду ждать вашего ответа)

";
    }

    private function vacancyRegardsText(): string
    {
        return "
--------------------------------------------
С уважением {CANDIDATE_NAME}
{CANDIDATE_EMAIL}
";
    }
}
