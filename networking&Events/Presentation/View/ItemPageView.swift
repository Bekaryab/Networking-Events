import SwiftUI
import PhotosUI

struct ItemPageView: View {
    @StateObject private var viewModel = ItemPageViewModel()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var eventManager: EventManager
    @Binding var selectedTab: Int
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            Form {
                
                // MARK: - Image Section
                Section {
                    VStack {
                        PhotosPicker(selection: $viewModel.selectedPhoto, matching: .images) {
                            if let data = viewModel.itemImage,
                               let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } else {
                                VStack(spacing: 10) {
                                    Image(systemName: "photo.badge.plus")
                                        .font(.system(size: 35))
                                        .foregroundStyle(.blue)
                                    
                                    Text("Upload Image")
                                        .font(.subheadline)
                                        .foregroundStyle(.blue)
                                }
                                .frame(width: 140, height: 140)
                                .background(Color.blue.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                // MARK: - Main Info
                Section("Event Info") {
                    TextField("Title", text: $viewModel.tittle)
                    
                    TextField("Location", text: $viewModel.location)
                    
                    DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                    
                    Text("Selected: \(viewModel.date, formatter: dateFormatter)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                // MARK: - Details
                Section("Details") {
                    TextField("Guests", text: $viewModel.guests)
                    
                    VStack(alignment: .leading) {
                        TextField("Description", text: $viewModel.description, axis: .vertical)
                            .lineLimit(3...6)
                        
                        HStack {
                            Spacer()
                            Text("\(viewModel.description.count)/100")
                                .font(.caption)
                                .foregroundStyle(
                                    viewModel.description.count >= 100 ? .red : .gray
                                )
                        }
                    }
                }
                
                // MARK: - Save Button
                Section {
                    Button {
                        let newEvent = EventItem(
                            photoData: viewModel.itemImage,
                            title1: viewModel.tittle,
                            location1: viewModel.location,
                            Date1: viewModel.date,
                            guests1: viewModel.guests,
                            description1: viewModel.description
                        )
                        eventManager.addEvent(event: newEvent)
                        selectedTab = 1
                        dismiss()
                    } label: {
                        Text("Save Event")
                            .frame(maxWidth: .infinity)
                            .fontWeight(.semibold)
                    }
                }
            }
            .navigationTitle("New Event")
            .navigationBarTitleDisplayMode(.inline)
            
            // BACK кнопка (если нужно вручную)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "chevron.left")
//                    }
//                }
//            }
        }
    }
}

#Preview {
    ItemPageView(selectedTab: .constant(0))
           .environmentObject(EventManager())
}
