xquery version "3.0";
let $speeches := collection('/db/course/inaugural')/speech
let $professions := distinct-values($speeches//profession[not(preceding-sibling::profession)])
return 
    <html>
        <head><title>Professions</title></head>
        <body>
            <ul>{
                for $profession in $professions
                let $people := $speeches[.//profession[position() = 1] = $profession]
                let $refs := $people//reference
                let $peopleCount := count($people)
                let $refCount := count($refs)
                let $refPerPerson := $refCount idiv $peopleCount
                order by $peopleCount descending, $profession
                return <li>{concat($peopleCount, ' persons with profession ',$profession,' used ',$refCount,' references, which is ', $refPerPerson,' refs per person')}</li>
            }</ul>
        </body>              
        </html>