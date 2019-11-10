class TitleValidator < ActiveModel::Validator
    def validate(record)
        click_bait = ["Won't Believe", "Secret", "Top #{/[\d]/}", "Guess"]
        bait_count = 0
        click_bait.each do |bait|
            if record.title.include?(bait)
                bait_count += 1
            end
        end
        if bait_count == 0
            record.errors[:title] << "Your title is not clickbait-y enough!"
        end
    end
end