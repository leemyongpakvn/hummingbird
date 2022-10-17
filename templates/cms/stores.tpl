{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Our stores' d='Shop.Theme.Global'}
{/block}

{block name='page_content'}
  <div class="row">
    {foreach $stores as $store}
      <article id="store-{$store.id}" class="store col-md-6 col-lg-4 col-xl-6">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-xl-6 store__picture">
                <picture>
                  <!-- <source 
                    srcset="
                    {$store.image.bySize.home_default.sources.webp} 250w" 
                    type="image/webp"> -->

                  <img
                    class="img-fluid rounded"
                    srcset="
                      {$store.image.bySize.default_200.sources.jpg} 200w,
                      {$store.image.bySize.default_400.sources.jpg} 2x"
                    src="{$store.image.bySize.default_200.sources.jpg}" 
                    loading="lazy"
                    {if !empty($store.image.legend)}
                      alt="{$store.image.legend}"
                      title="{$store.image.legend}"
                    {else}
                      alt="{$store.name}"
                    {/if}
                </picture>
              </div>
              <div class="col-xl-6 store__description d-none d-md-block">
                <h2 class="h6 store__name">{$store.name}</h2>
                <address class="store__address">{$store.address.formatted nofilter}</address>
                {if $store.note || $store.phone || $store.fax || $store.email}
                  <a data-bs-toggle="collapse" href="#about-{$store.id}" aria-expanded="false" aria-controls="about-{$store.id}"><strong>{l s='About and Contact' d='Shop.Theme.Global'}</strong><i class="material-icons">&#xE409;</i></a>
                {/if}
                <hr>
                <table class="store__opening-times">
                  {foreach $store.business_hours as $day}
                  <tr>
                    <th>{$day.day|truncate:4:'.'}</th>
                    <td>
                      <ul>
                      {foreach $day.hours as $h}
                        <li>{$h}</li>
                      {/foreach}
                      </ul>
                    </td>
                  </tr>
                  {/foreach}
                </table>
              </div>
              <div class="store__description accordion d-block d-md-none">
                <div class="accordion-item">
                  <h2 class="h6 store__name">{$store.name}</h2>
                  <address class="store__address">{$store.address.formatted nofilter}</address>
                  {if $store.note || $store.phone || $store.fax || $store.email}
                    <a data-bs-toggle="collapse" href="#about-{$store.id}" aria-expanded="false" aria-controls="about-{$store.id}"><strong>{l s='About and Contact' d='Shop.Theme.Global'}</strong><i class="material-icons">&#xE409;</i></a>
                  {/if}
                  <hr>
                  <button class="store__toggle accordion-button collapsed pb-2 px-0" data-bs-toggle="collapse" data-bs-target="#table-{$store.id}">{l s='View schedules' d='Shop.Theme.Global'}</button>
                  <table id="table-{$store.id}" class="store__opening-times accordion-collapse collapse">
                    {foreach $store.business_hours as $day}
                    <tr>
                      <th>{$day.day|truncate:4:'.'}</th>
                      <td>
                        <ul>
                        {foreach $day.hours as $h}
                          <li>{$h}</li>
                        {/foreach}
                        </ul>
                      </td>
                    </tr>
                    {/foreach}
                  </table>
                </div>
              </div>
            </div>
          </div>
          {if $store.note || $store.phone || $store.fax || $store.email}
            <div class="card-footer store__footer collapse" id="about-{$store.id}">
              {if $store.note}
                  <p class="store__note">{$store.note}</p>
              {/if}
              <ul class="store__contacts">
                {if $store.phone}
                  <li><i class="material-icons">&#xE0B0;</i>{$store.phone}</li>
                {/if}
                {if $store.fax}
                  <li><i class="material-icons">&#xE8AD;</i>{$store.fax}</li>
                {/if}
                {if $store.email}
                  <li><i class="material-icons">&#xE0BE;</i>{$store.email}</li>
                {/if}
              </ul>
            </div>
          {/if}
        </div>
      </article>
    {/foreach}
  </div>
{/block}
