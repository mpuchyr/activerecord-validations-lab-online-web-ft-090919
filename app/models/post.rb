class Post < ActiveRecord::Base
    # include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :article_not_clickbaity_enough

    def article_not_clickbaity_enough
        click_bait = ["Won't Believe", "Secret", "Top #{/[\d]/}", "Guess"]
        bait_count = 0
        if self.title
            click_bait.each do |bait|
                if title.include?(bait)
                    bait_count += 1
                end
            end
            if bait_count == 0
                errors[:title] << "Your title is not clickbait-y enough!"
            end
        end

    end

end
