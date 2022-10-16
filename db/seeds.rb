
if Team.count == 0
    puts '##### ADD Team #####'
    # Archive players
    players = JSON.parse(File.read(Rails.root.join('db', 'players.json')))

    players['data']['teams'].each do |t|
        team = Team.create(name: t['name'], acronym: t['acronym'])
        t['players'].each do |p|
            Player.create(
                name: p['name'],                                                   
                number: p['number'] == 'nil' ? nil : p['number'],                                                 
                nationality: p['nationality'],                                            
                birth_date: p['birthdate'],                                                    
                position: p['position'],                                               
                team: team
            )
        end
    end
    puts '##### End ADD Team #####'
end

unless Admin.exists?(email: 'admin@admin.com')
    Admin.create(email: 'admin@admin.com', password: '123123123', name: 'Admin test')
end