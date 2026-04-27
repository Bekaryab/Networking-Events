//
//  InformationOfEvents.swift
//  networking&Events
//
//  Created by bekarys abiev on 25.02.2026.
//

import SwiftUI

struct InformationOfEventsView: View {
    let event: EventItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // 1. Блок с картинкой
                if let eventImage = event.photoData, let uiImage = UIImage(data: eventImage) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipped()
                } else {
                    // Заглушка, если картинки нет
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        )
                }
                
                // Основной контент
                VStack(alignment: .leading, spacing: 20) {
                    
                    // 2. Заголовок
                    Text(event.title1 ?? "No name")
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .foregroundColor(.primary)
                    
                    // 3. Карточка с основной информацией (Иконки + Текст)
                    VStack(alignment: .leading, spacing: 16) {
                        InfoRow(icon: "person.fill", text: event.guests1 ?? "No guest")
                        InfoRow(icon: "calendar", text: event.Date1?.formatted(date: .abbreviated, time: .shortened) ?? "No date")
                        InfoRow(icon: "mappin.and.ellipse", text: event.location1 ?? "No location")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(16)
                    
                    // 4. Описание
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text(event.description1 ?? "No description provided.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineSpacing(4) // Добавляем воздуха между строками
                    }
                }
                .padding(.horizontal)
            }
        }
        .edgesIgnoringSafeArea(.top) // Картинка будет уходить под самый верх экрана
        .navigationBarTitleDisplayMode(.inline)
        // Кнопка "Назад" будет видна благодаря полупрозрачному фону (SwiftUI делает это автоматически)
    }
}

// Вспомогательный View для строк с иконками, чтобы не дублировать код
struct InfoRow: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.blue) // Можешь заменить на свой акцентный цвет
                .frame(width: 24)
            
            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    InformationOfEventsView(event: EventItem())
}
