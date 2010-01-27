let $doc := fn:doc("films.xml") return 

<result>
{
for $actor in distinct-values($doc//ROLE/NOM)
return <Actor
name='{$actor}'>{for $role in $doc//ROLE[NOM=$actor] return
<Role>{$role/INTITULE/text()}</Role>}</Actor>
}
</result>