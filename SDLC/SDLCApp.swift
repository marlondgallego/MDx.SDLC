import SwiftUI
import Charts

// MARK: - Theme (Abbott brand palette)

enum AbbottTheme {
    static let navy = Color(red: 0.00, green: 0.13, blue: 0.36)
    static let blue = Color(red: 0.00, green: 0.45, blue: 0.81)
    static let sky = Color(red: 0.85, green: 0.93, blue: 0.98)
    static let cardBackground = Color(.systemBackground)
    static let sectionBackground = Color(red: 0.95, green: 0.97, blue: 0.99)
    static let mutedText = Color.secondary
    static let accentGold = Color(red: 0.95, green: 0.75, blue: 0.15)

    static let stageColors: [String: Color] = [
        "plan": Color(red: 0.00, green: 0.62, blue: 0.72),
        "build": Color(red: 0.00, green: 0.45, blue: 0.81),
        "check": Color(red: 0.95, green: 0.55, blue: 0.15),
        "confirm": Color(red: 0.45, green: 0.25, blue: 0.65),
        "deliver": Color(red: 0.10, green: 0.60, blue: 0.35)
    ]

    static func stageColor(for id: String) -> Color {
        stageColors[id] ?? blue
    }
}

// MARK: - Layout (iPhone 15 Pro: 393 × 852 pt)

enum LayoutMetrics {
    static let screenWidth: CGFloat = 393
    static let horizontalPadding: CGFloat = 20
    static let sectionSpacing: CGFloat = 28
    static let cardCornerRadius: CGFloat = 14
    static let contentWidth: CGFloat = screenWidth - (horizontalPadding * 2)
    static let wheelDiameter: CGFloat = min(contentWidth, 340)
    static let wheelInnerRatio: CGFloat = 0.52
}

// MARK: - Data Models

struct SDLCDocument {
    let brandName: String
    let title: String
    let subtitle: String
}

struct SDLCGoalItem: Identifiable {
    let id: String
    let title: String
    let description: String
    let symbol: String
}

struct SDLCPrincipleItem: Identifiable {
    let id: String
    let title: String
    let description: String
    let symbol: String
}

struct SDLCLifecycleStage: Identifiable {
    let id: String
    let sequence: Int
    let name: String
    let description: String
    let teamIDs: [String]
}

struct SDLCTeam: Identifiable {
    let id: String
    let name: String
    let description: String
    let symbol: String
}

struct SDLCBenefitItem: Identifiable {
    let id: String
    let text: String
    let symbol: String
}

struct SDLCProduct: Identifiable {
    let id: String
    let name: String
    let tagline: String?
    let description: String
    let hasDashboard: Bool
    let imageAsset: String?
}

struct SDLCCyberPillar: Identifiable {
    let id: String
    let title: String
    let symbol: String
}

struct SDLCChartPoint: Identifiable {
    let id = UUID()
    let hour: Int
    let series: String
    let value: Double
}

// MARK: - Static Content (mirrors sdlc-infographic.json)

enum SDLCContent {
    static let document = SDLCDocument(
        brandName: "Abbott",
        title: "MDx SOFTWARE DEVELOPMENT LIFECYCLE",
        subtitle: "How we build and deliver reliable software that powers life-changing diagnostics"
    )

    static let goals: [SDLCGoalItem] = [
        .init(id: "safe-secure", title: "SAFE & SECURE", description: "Protects patient and customer data.", symbol: "shield.fill"),
        .init(id: "reliable", title: "RELIABLE", description: "Works accurately every time.", symbol: "medal.fill"),
        .init(id: "made-for-you", title: "MADE FOR YOU", description: "Meets your needs and expectations.", symbol: "person.2.fill"),
        .init(id: "innovative", title: "INNOVATIVE", description: "Continuously improving.", symbol: "paperplane.fill"),
        .init(id: "collaborative", title: "COLLABORATIVE", description: "Built by teams working together.", symbol: "hand.raised.fill"),
        .init(id: "compliant", title: "COMPLIANT", description: "Follows all quality and regulatory standards.", symbol: "globe.americas.fill")
    ]

    static let principles: [SDLCPrincipleItem] = [
        .init(id: "step-by-step", title: "STEP BY STEP", description: "We break work into small, manageable steps and build incrementally.", symbol: "target"),
        .init(id: "continuous-improvement", title: "CONTINUOUS IMPROVEMENT", description: "We learn, improve and refine with each cycle.", symbol: "arrow.triangle.2.circlepath"),
        .init(id: "built-to-solve-real-needs", title: "BUILT TO SOLVE REAL NEEDS", description: "We focus on solving real problems that matter most.", symbol: "person.3.fill"),
        .init(id: "quality-at-every-step", title: "QUALITY AT EVERY STEP", description: "We test early and often to ensure high quality.", symbol: "list.clipboard.fill"),
        .init(id: "ready-for-change", title: "READY FOR CHANGE", description: "We adapt quickly to new needs and opportunities.", symbol: "chart.line.uptrend.xyaxis")
    ]

    static let stages: [SDLCLifecycleStage] = [
        .init(id: "plan", sequence: 1, name: "PLAN", description: "We understand the need and plan the best way to solve it.", teamIDs: ["product-management", "marketing", "assay-team", "systems-engineering", "regulatory-affairs", "clinical-medical-affairs"]),
        .init(id: "build", sequence: 2, name: "BUILD", description: "We design and build the software.", teamIDs: ["software-engineering", "assay-team", "systems-engineering", "quality-assurance", "devops"]),
        .init(id: "check", sequence: 3, name: "CHECK", description: "We test everything carefully to make sure it works as expected.", teamIDs: ["quality-assurance", "assay-team", "regulatory-affairs", "clinical-medical-affairs"]),
        .init(id: "confirm", sequence: 4, name: "CONFIRM", description: "We review the results with the right experts and make sure it meets all requirements.", teamIDs: ["assay-team", "quality-assurance", "regulatory-affairs", "clinical-medical-affairs", "systems-engineering", "product-management"]),
        .init(id: "deliver", sequence: 5, name: "DELIVER", description: "We safely release the software so you can use it with confidence.", teamIDs: ["software-engineering", "quality-assurance", "regulatory-affairs", "clinical-medical-affairs", "customer-support", "devops"])
    ]

    static let teams: [SDLCTeam] = [
        .init(id: "product-management", name: "Product Management", description: "Understands your needs and defines what we should build.", symbol: "person.3.fill"),
        .init(id: "marketing", name: "Marketing", description: "Shares insights and ensures our solutions bring real value.", symbol: "megaphone.fill"),
        .init(id: "systems-engineering", name: "Systems Engineering", description: "Designs the overall system and ensures everything works together.", symbol: "gearshape.2.fill"),
        .init(id: "software-engineering", name: "Software Engineering", description: "Writes and builds the software.", symbol: "chevron.left.forwardslash.chevron.right"),
        .init(id: "assay-team", name: "Assay Team", description: "Provides scientific and assay expertise to ensure accuracy and performance.", symbol: "flask.fill"),
        .init(id: "quality-assurance", name: "Quality Assurance (QA)", description: "Tests the software to ensure it is safe, reliable and easy to use.", symbol: "checkmark.shield.fill"),
        .init(id: "regulatory-affairs", name: "Regulatory Affairs", description: "Ensures we meet all required regulatory standards.", symbol: "checklist"),
        .init(id: "clinical-medical-affairs", name: "Clinical / Medical Affairs", description: "Provides clinical input and ensures the right outcomes.", symbol: "heart.text.square.fill"),
        .init(id: "cybersecurity", name: "Cybersecurity", description: "Protects data and systems every step of the way.", symbol: "lock.shield.fill"),
        .init(id: "devops", name: "DevOps", description: "Ensures smooth, secure delivery and ongoing improvements.", symbol: "infinity"),
        .init(id: "manufacturing-operations", name: "Manufacturing Operations", description: "Prepares for production and ensures reliable delivery.", symbol: "building.2.fill"),
        .init(id: "customer-support", name: "Customer Support", description: "Provides training, support and feedback to keep improving.", symbol: "headphones")
    ]

    static let benefits: [SDLCBenefitItem] = [
        .init(id: "trust", text: "You can trust our software is safe, reliable and secure.", symbol: "checkmark.shield.fill"),
        .init(id: "accuracy", text: "It helps you deliver accurate results with confidence.", symbol: "leaf.fill"),
        .init(id: "improvement", text: "We continuously improve to make your experience better.", symbol: "clock.fill"),
        .init(id: "support", text: "We are here to support you—before, during and after you go live.", symbol: "headphones"),
        .init(id: "shared-success", text: "Your success is our success.", symbol: "heart.fill")
    ]

    static let products: [SDLCProduct] = [
        .init(id: "alinity-m-system", name: "Alinity m System", tagline: "Powerful. Flexible. Connected.", description: "Enabling high throughput and automation for molecular diagnostics.", hasDashboard: false, imageAsset: "AlinityMSystem"),
        .init(id: "alinity-mp", name: "Alinity mp System", tagline: nil, description: "An integrated end-to-end real-time PCR system delivering trusted results with walk-away convenience.", hasDashboard: false, imageAsset: "AlinityMPSystem"),
        .init(id: "m2000-system", name: "m2000 System", tagline: nil, description: "Automated sample preparation system that delivers reliability, flexibility and scalability.", hasDashboard: false, imageAsset: "M2000System"),
        .init(id: "vp2000-system", name: "VP2000 System", tagline: nil, description: "Sample-to-answer system that integrates PCR setup, amplification and detection in one solution.", hasDashboard: false, imageAsset: "VP2000System"),
        .init(id: "mview", name: "mView", tagline: nil, description: "Data management system that delivers real-time visibility and actionable insights.", hasDashboard: true, imageAsset: "MView")
    ]

    static let cyberPillars: [SDLCCyberPillar] = [
        .init(id: "threat-modeling", title: "Threat Modeling & Risk Assessment", symbol: "magnifyingglass.circle.fill"),
        .init(id: "secure-coding", title: "Secure Coding Practices", symbol: "chevron.left.forwardslash.chevron.right"),
        .init(id: "vulnerability-management", title: "Vulnerability Management", symbol: "ladybug.fill"),
        .init(id: "security-testing", title: "Security Testing & Verification", symbol: "checkmark.shield.fill"),
        .init(id: "training-awareness", title: "Training & Awareness", symbol: "graduationcap.fill")
    ]

    static let teamsByID = Dictionary(uniqueKeysWithValues: teams.map { ($0.id, $0) })

    static let mViewChartData: [SDLCChartPoint] = {
        var points: [SDLCChartPoint] = []
        let series = ["Samples", "QC Pass Rate", "Turnaround"]
        for name in series {
            for hour in 0..<12 {
                let base = name == "Samples" ? 40.0 : name == "QC Pass Rate" ? 92.0 : 28.0
                let wave = sin(Double(hour) / 2.0) * (name == "Samples" ? 12 : 4)
                points.append(.init(hour: hour, series: name, value: base + wave + Double(hour)))
            }
        }
        return points
    }()
}

// MARK: - Selection / Presentation

enum SDLCSelection: Identifiable, Equatable, Hashable {
    case goal(String)
    case principle(String)
    case lifecycleStage(String)
    case lifecycleOverview
    case team(String)
    case benefit(String)
    case product(String)
    case cyberPillar(String)
    case cybersecurityOverview

    var id: String {
        switch self {
        case .goal(let id): return "goal-\(id)"
        case .principle(let id): return "principle-\(id)"
        case .lifecycleStage(let id): return "stage-\(id)"
        case .lifecycleOverview: return "lifecycle-overview"
        case .team(let id): return "team-\(id)"
        case .benefit(let id): return "benefit-\(id)"
        case .product(let id): return "product-\(id)"
        case .cyberPillar(let id): return "pillar-\(id)"
        case .cybersecurityOverview: return "cyber-overview"
        }
    }
}

// MARK: - Custom Shapes

struct AnnularSegmentShape: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var innerRadiusRatio: CGFloat

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * innerRadiusRatio

        var path = Path()
        path.addArc(center: center, radius: outerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.addArc(center: center, radius: innerRadius, startAngle: endAngle, endAngle: startAngle, clockwise: true)
        path.closeSubpath()
        return path
    }
}

struct FlowArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 8, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 14, y: rect.midY - 5))
        path.move(to: CGPoint(x: rect.maxX - 8, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 14, y: rect.midY + 5))
        return path
    }
}

struct RoundedSectionBackground: Shape {
    var radius: CGFloat = LayoutMetrics.cardCornerRadius

    func path(in rect: CGRect) -> Path {
        RoundedRectangle(cornerRadius: radius, style: .continuous).path(in: rect)
    }
}

// MARK: - Reusable Components

struct SectionHeaderView: View {
    let title: String
    var subtitle: String? = nil
    var style: HeaderStyle = .standard

    enum HeaderStyle { case standard, banner, footer }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(style == .banner ? .caption.weight(.bold) : .subheadline.weight(.heavy))
                .foregroundStyle(style == .footer ? .white : AbbottTheme.navy)
                .textCase(.uppercase)
                .tracking(0.6)

            if let subtitle {
                Text(subtitle)
                    .font(.footnote)
                    .foregroundStyle(style == .footer ? .white.opacity(0.9) : AbbottTheme.mutedText)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct IconBadge: View {
    let symbol: String
    var tint: Color = AbbottTheme.blue
    var size: CGFloat = 36

    var body: some View {
        ZStack {
            Circle()
                .fill(tint.opacity(0.12))
                .frame(width: size, height: size)
            Image(systemName: symbol)
                .font(.system(size: size * 0.42, weight: .semibold))
                .foregroundStyle(tint)
        }
    }
}

struct SDLCChip: View {
    let title: String
    var color: Color = AbbottTheme.blue

    var body: some View {
        Text(title)
            .font(.caption2.weight(.semibold))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(color.opacity(0.12), in: Capsule())
            .foregroundStyle(color)
    }
}

// MARK: - Lifecycle Wheel

struct LifecycleWheelView: View {
    let stages: [SDLCLifecycleStage]
    @Binding var selectedStageID: String
    @Binding var activeSelection: SDLCSelection?

    private let gapDegrees: Double = 3.5

    var body: some View {
        ZStack {
            ForEach(Array(stages.enumerated()), id: \.element.id) { index, stage in
                let slice = sliceAngles(for: index)
                let isSelected = selectedStageID == stage.id

                Button {
                    selectedStageID = stage.id
                    activeSelection = .lifecycleStage(stage.id)
                } label: {
                    AnnularSegmentShape(
                        startAngle: .degrees(slice.start),
                        endAngle: .degrees(slice.end),
                        innerRadiusRatio: LayoutMetrics.wheelInnerRatio
                    )
                    .fill(AbbottTheme.stageColor(for: stage.id).opacity(isSelected ? 1.0 : 0.82))
                    .overlay {
                        AnnularSegmentShape(
                            startAngle: .degrees(slice.start),
                            endAngle: .degrees(slice.end),
                            innerRadiusRatio: LayoutMetrics.wheelInnerRatio
                        )
                        .stroke(.white.opacity(isSelected ? 0.9 : 0.35), lineWidth: isSelected ? 2 : 1)
                    }
                }
                .buttonStyle(.plain)
                .accessibilityLabel("\(stage.name), stage \(stage.sequence) of 5")
            }

            Button {
                activeSelection = .lifecycleOverview
            } label: {
                VStack(spacing: 8) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .font(.title2)
                        .foregroundStyle(AbbottTheme.blue)
                    Text("A SIMPLE, REPEATABLE PROCESS THAT DELIVERS VALUE AT EVERY STEP.")
                        .font(.caption2.weight(.semibold).pointSize(9))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(AbbottTheme.navy)
                        .padding(.horizontal, 55)
                }
                .frame(width: LayoutMetrics.wheelDiameter * LayoutMetrics.wheelInnerRatio * 1.55)
            }
            .buttonStyle(.plain)
        }
        .frame(width: LayoutMetrics.wheelDiameter, height: LayoutMetrics.wheelDiameter)
        .overlay {
            stageLabelsOverlay
        }
    }

    private var stageLabelsOverlay: some View {
        GeometryReader { geo in
            let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
            let labelRadius = geo.size.width * 0.39

            ForEach(Array(stages.enumerated()), id: \.element.id) { index, stage in
                let midAngle = (sliceAngles(for: index).start + sliceAngles(for: index).end) / 2
                let radians = midAngle * .pi / 180
                let point = CGPoint(
                    x: center.x + cos(radians) * labelRadius,
                    y: center.y + sin(radians) * labelRadius
                )

                Text("\(stage.sequence). \(stage.name)")
                    .font(.caption2.weight(.heavy))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.35), radius: 1, x: 0, y: 1)
                    .position(point)
            }
        }
    }

    private func sliceAngles(for index: Int) -> (start: Double, end: Double) {
        let count = Double(stages.count)
        let slice = 360.0 / count
        let start = -90.0 + slice * Double(index) + gapDegrees / 2
        let end = start + slice - gapDegrees
        return (start, end)
    }
}

// MARK: - mView Charts

struct MViewMiniDashboard: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 10) {
                Gauge(value: 0.78) {
                    Text("Load")
                } currentValueLabel: {
                    Text("78%")
                        .font(.caption2.weight(.bold))
                }
                .gaugeStyle(.accessoryCircular)
                .tint(AbbottTheme.blue)
                .scaleEffect(0.9)

                Chart(SDLCContent.mViewChartData.filter { $0.series == "Samples" }) { point in
                    LineMark(
                        x: .value("Hour", point.hour),
                        y: .value("Samples", point.value)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(AbbottTheme.blue)
                }
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .frame(height: 44)
            }
        }
        .padding(10)
        .background(AbbottTheme.sky, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct ProductArtwork: View {
    let product: SDLCProduct

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [AbbottTheme.blue.opacity(0.10), AbbottTheme.sky],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            if let imageAsset = product.imageAsset {
                Image(imageAsset)
                    .resizable()
                    .scaledToFit()
                    .padding(6)
                    .accessibilityLabel(product.name)
            } else {
                Image(systemName: product.hasDashboard ? "chart.bar.doc.horizontal.fill" : "desktopcomputer")
                    .font(.title)
                    .foregroundStyle(AbbottTheme.blue)
                    .accessibilityHidden(true)
            }
        }
        .frame(height: 112)
        .clipped()
    }
}

struct MViewDashboardPreview: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 16) {
                        Gauge(value: 0.78) {
                            Text("Instrument Load")
                        } currentValueLabel: {
                            Text("78%").font(.headline)
                        } minimumValueLabel: {
                            Text("0%")
                        } maximumValueLabel: {
                            Text("100%")
                        }
                        .gaugeStyle(.accessoryCircularCapacity)
                        .tint(AbbottTheme.blue)
                        .frame(width: 100)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("mView Dashboard")
                                .font(.title3.weight(.bold))
                                .foregroundStyle(AbbottTheme.navy)
                            Text("Real-time visibility and actionable insights across your lab.")
                                .font(.footnote)
                                .foregroundStyle(AbbottTheme.mutedText)
                        }
                    }

                    Chart(SDLCContent.mViewChartData) { point in
                        LineMark(
                            x: .value("Hour", point.hour),
                            y: .value("Value", point.value)
                        )
                        .foregroundStyle(by: .value("Series", point.series))
                        .interpolationMethod(.catmullRom)
                    }
                    .frame(height: 180)
                    .chartLegend(position: .bottom, alignment: .leading)

                    let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
                    LazyVGrid(columns: gridColumns, spacing: 12) {
                        ForEach(["Samples", "QC Pass Rate", "Turnaround"], id: \.self) { series in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(series)
                                    .font(.caption.weight(.semibold))
                                    .foregroundStyle(AbbottTheme.navy)
                                Chart(SDLCContent.mViewChartData.filter { $0.series == series }) { point in
                                    LineMark(
                                        x: .value("Hour", point.hour),
                                        y: .value("Value", point.value)
                                    )
                                    .foregroundStyle(AbbottTheme.stageColor(for: series == "Samples" ? "build" : series == "QC Pass Rate" ? "deliver" : "check"))
                                }
                                .chartXAxis(.hidden)
                                .frame(height: 70)
                            }
                            .padding(10)
                            .background(AbbottTheme.sectionBackground, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        }
                    }
                }
                .padding(20)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("mView")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

// MARK: - Section Views

struct DocumentHeaderView: View {
    let document: SDLCDocument

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Image("AbbottLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 174, maxHeight: 44, alignment: .leading)
                    .accessibilityLabel(document.brandName)
                Spacer()
            }

            Text(document.title)
                .font(.title2.weight(.heavy))
                .foregroundStyle(AbbottTheme.navy)
                .fixedSize(horizontal: false, vertical: true)

            Text(document.subtitle)
                .font(.subheadline)
                .foregroundStyle(AbbottTheme.mutedText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(18)
        .background {
            RoundedSectionBackground()
                .fill(
                    LinearGradient(
                        colors: [AbbottTheme.sky, .white],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        }
    }
}

struct GoalGridSection: View {
    @Binding var activeSelection: SDLCSelection?

    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "OUR GOAL", subtitle: "We build software that is:")

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(SDLCContent.goals) { goal in
                    Button {
                        activeSelection = .goal(goal.id)
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            IconBadge(symbol: goal.symbol)
                            Text(goal.title)
                                .font(.caption.weight(.heavy))
                                .foregroundStyle(AbbottTheme.navy)
                                .multilineTextAlignment(.leading)
                            Text(goal.description)
                                .font(.caption2)
                                .foregroundStyle(AbbottTheme.mutedText)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
                        .padding(12)
                        .background(AbbottTheme.cardBackground, in: RoundedRectangle(cornerRadius: LayoutMetrics.cardCornerRadius, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: LayoutMetrics.cardCornerRadius, style: .continuous)
                                .stroke(AbbottTheme.blue.opacity(0.12), lineWidth: 1)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }

            Text("All so you can deliver the best care to your patients and communities.")
                .font(.footnote.weight(.medium))
                .foregroundStyle(AbbottTheme.navy)
                .padding(.top, 4)
        }
    }
}

struct PrinciplesSection: View {
    @Binding var activeSelection: SDLCSelection?

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "HOW WE BUILD GREAT SOFTWARE")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(SDLCContent.principles) { principle in
                        Button {
                            activeSelection = .principle(principle.id)
                        } label: {
                            VStack(alignment: .leading, spacing: 8) {
                                IconBadge(symbol: principle.symbol, size: 32)
                                Text(principle.title)
                                    .font(.caption2.weight(.heavy))
                                    .foregroundStyle(AbbottTheme.navy)
                                    .multilineTextAlignment(.leading)
                                Text(principle.description)
                                    .font(.caption2)
                                    .foregroundStyle(AbbottTheme.mutedText)
                                    .lineLimit(4)
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(width: 148, alignment: .topLeading)
                            .padding(12)
                            .background(AbbottTheme.sectionBackground, in: RoundedRectangle(cornerRadius: LayoutMetrics.cardCornerRadius, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.vertical, 2)
            }
        }
    }
}

struct LifecycleSection: View {
    @Binding var activeSelection: SDLCSelection?
    @Binding var selectedStageID: String

    var body: some View {
        VStack(spacing: 16) {
            SectionHeaderView(
                title: "Lifecycle Process",
                subtitle: "A simple, repeatable process that delivers value at every step."
            )

            LifecycleWheelView(
                stages: SDLCContent.stages,
                selectedStageID: $selectedStageID,
                activeSelection: $activeSelection
            )
            .frame(maxWidth: .infinity)

            HStack(spacing: 8) {
                ForEach(SDLCContent.stages) { stage in
                    Button {
                        selectedStageID = stage.id
                        activeSelection = .lifecycleStage(stage.id)
                    } label: {
                        VStack(spacing: 4) {
                            Circle()
                                .fill(AbbottTheme.stageColor(for: stage.id))
                                .frame(width: selectedStageID == stage.id ? 10 : 7, height: selectedStageID == stage.id ? 10 : 7)
                            Text(stage.name)
                                .font(.system(size: 9, weight: .bold))
                                .foregroundStyle(selectedStageID == stage.id ? AbbottTheme.navy : AbbottTheme.mutedText)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(16)
        .background(AbbottTheme.sectionBackground, in: RoundedRectangle(cornerRadius: LayoutMetrics.cardCornerRadius, style: .continuous))
    }
}

struct TeamsSection: View {
    @Binding var activeSelection: SDLCSelection?
    @Binding var searchText: String

    private var filteredTeams: [SDLCTeam] {
        guard !searchText.isEmpty else { return SDLCContent.teams }
        return SDLCContent.teams.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.description.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "TEAMS ACROSS ABBOTT WORKING FOR YOU")

            TextField("Search teams", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .font(.subheadline)

            VStack(spacing: 10) {
                ForEach(filteredTeams) { team in
                    Button {
                        activeSelection = .team(team.id)
                    } label: {
                        HStack(alignment: .top, spacing: 12) {
                            IconBadge(symbol: team.symbol, size: 34)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(team.name)
                                    .font(.subheadline.weight(.semibold))
                                    .foregroundStyle(AbbottTheme.navy)
                                Text(team.description)
                                    .font(.caption)
                                    .foregroundStyle(AbbottTheme.mutedText)
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer(minLength: 0)
                            Image(systemName: "chevron.right")
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(AbbottTheme.mutedText)
                        }
                        .padding(12)
                        .background(AbbottTheme.cardBackground, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(Color.black.opacity(0.06), lineWidth: 1)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct BenefitsSection: View {
    @Binding var activeSelection: SDLCSelection?

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "WHAT DOES THIS MEAN FOR YOU?")

            VStack(spacing: 10) {
                ForEach(SDLCContent.benefits) { benefit in
                    Button {
                        activeSelection = .benefit(benefit.id)
                    } label: {
                        HStack(spacing: 12) {
                            IconBadge(symbol: benefit.symbol, tint: AbbottTheme.stageColor(for: "deliver"), size: 32)
                            Text(benefit.text)
                                .font(.footnote)
                                .foregroundStyle(AbbottTheme.navy)
                                .multilineTextAlignment(.leading)
                            Spacer(minLength: 0)
                        }
                        .padding(12)
                        .background(AbbottTheme.sky.opacity(0.55), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct ProductsSection: View {
    @Binding var activeSelection: SDLCSelection?
    let onOpenDashboard: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionHeaderView(title: "OUR SOLUTIONS THAT POWER YOUR WORK")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(SDLCContent.products) { product in
                        Button {
                            activeSelection = .product(product.id)
                        } label: {
                            VStack(alignment: .leading, spacing: 10) {
                                ProductArtwork(product: product)

                                Text(product.name)
                                    .font(.subheadline.weight(.bold))
                                    .foregroundStyle(AbbottTheme.navy)

                                if let tagline = product.tagline {
                                    Text(tagline)
                                        .font(.caption.weight(.semibold))
                                        .foregroundStyle(AbbottTheme.blue)
                                }

                                Text(product.description)
                                    .font(.caption2)
                                    .foregroundStyle(AbbottTheme.mutedText)
                                    .lineLimit(4)
                                    .multilineTextAlignment(.leading)

                                if product.hasDashboard {
                                    MViewMiniDashboard()
                                    Button("View Dashboard") {
                                        onOpenDashboard()
                                    }
                                    .font(.caption.weight(.semibold))
                                    .buttonStyle(.borderedProminent)
                                    .tint(AbbottTheme.blue)
                                }
                            }
                            .frame(width: 220, alignment: .topLeading)
                            .padding(12)
                            .background(AbbottTheme.cardBackground, in: RoundedRectangle(cornerRadius: LayoutMetrics.cardCornerRadius, style: .continuous))
                            .overlay {
                                RoundedRectangle(cornerRadius: LayoutMetrics.cardCornerRadius, style: .continuous)
                                    .stroke(AbbottTheme.blue.opacity(0.15), lineWidth: 1)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

struct CybersecuritySection: View {
    @Binding var activeSelection: SDLCSelection?

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Button {
                activeSelection = .cybersecurityOverview
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    SectionHeaderView(
                        title: "CYBERSECURITY: BUILT IN. NOT BOLTED ON.",
                        subtitle: "Security is part of everything we do—from the first line of code to the products you use.",
                        style: .footer
                    )
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AbbottTheme.navy, in: RoundedRectangle(cornerRadius: LayoutMetrics.cardCornerRadius, style: .continuous))
            }
            .buttonStyle(.plain)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(SDLCContent.cyberPillars) { pillar in
                        Button {
                            activeSelection = .cyberPillar(pillar.id)
                        } label: {
                            VStack(spacing: 8) {
                                IconBadge(symbol: pillar.symbol, tint: .white, size: 34)
                                    .background(AbbottTheme.blue, in: Circle())
                                Text(pillar.title)
                                    .font(.caption2.weight(.semibold))
                                    .foregroundStyle(AbbottTheme.navy)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 110)
                            }
                            .padding(12)
                            .background(AbbottTheme.sectionBackground, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

// MARK: - Detail Sheets

struct SDLCDetailSheet: View {
    let selection: SDLCSelection
    @Binding var selectedStageID: String
    let onTeamTap: (String) -> Void

    var body: some View {
        switch selection {
        case .goal(let id):
            if let goal = SDLCContent.goals.first(where: { $0.id == id }) {
                detailScaffold(icon: goal.symbol, title: goal.title, body: goal.description)
            }
        case .principle(let id):
            if let item = SDLCContent.principles.first(where: { $0.id == id }) {
                detailScaffold(icon: item.symbol, title: item.title, body: item.description)
            }
        case .benefit(let id):
            if let item = SDLCContent.benefits.first(where: { $0.id == id }) {
                detailScaffold(icon: item.symbol, title: "For You", body: item.text)
            }
        case .product(let id):
            if let product = SDLCContent.products.first(where: { $0.id == id }) {
                detailScaffold(icon: "desktopcomputer", title: product.name, body: product.description, tagline: product.tagline)
            }
        case .cyberPillar(let id):
            if let pillar = SDLCContent.cyberPillars.first(where: { $0.id == id }) {
                detailScaffold(icon: pillar.symbol, title: pillar.title, body: "Security is embedded throughout the SDLC—from threat modeling to training and awareness.")
            }
        case .cybersecurityOverview:
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Security is part of everything we do—from the first line of code to the products you use.")
                        .font(.body)
                    ForEach(SDLCContent.cyberPillars) { pillar in
                        HStack(spacing: 12) {
                            IconBadge(symbol: pillar.symbol)
                            Text(pillar.title)
                                .font(.subheadline.weight(.semibold))
                        }
                    }
                }
                .padding(20)
            }
        case .lifecycleOverview:
            ScrollView {
                VStack(spacing: 14) {
                    ForEach(SDLCContent.stages) { stage in
                        stageCard(stage)
                    }
                }
                .padding(20)
            }
        case .lifecycleStage:
            LifecycleStageSheet(selectedStageID: $selectedStageID, onTeamTap: onTeamTap)
        case .team(let id):
            TeamDetailSheet(teamID: id, onStageTap: { selectedStageID = $0 })
        }
    }

    @ViewBuilder
    private func detailScaffold(icon: String, title: String, body: String, tagline: String? = nil) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                IconBadge(symbol: icon, size: 48)
                Text(title)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(AbbottTheme.navy)
                if let tagline {
                    Text(tagline)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(AbbottTheme.blue)
                }
                Text(body)
                    .font(.body)
                    .foregroundStyle(AbbottTheme.mutedText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
        }
    }

    @ViewBuilder
    private func stageCard(_ stage: SDLCLifecycleStage) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(stage.sequence). \(stage.name)")
                    .font(.headline)
                    .foregroundStyle(AbbottTheme.stageColor(for: stage.id))
                Spacer()
                Text("\(stage.teamIDs.count) teams")
                    .font(.caption)
                    .foregroundStyle(AbbottTheme.mutedText)
            }
            Text(stage.description)
                .font(.footnote)
                .foregroundStyle(AbbottTheme.mutedText)
        }
        .padding(14)
        .background(AbbottTheme.sectionBackground, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

struct LifecycleStageSheet: View {
    @Binding var selectedStageID: String
    let onTeamTap: (String) -> Void

    private var stage: SDLCLifecycleStage? {
        SDLCContent.stages.first { $0.id == selectedStageID }
    }

    var body: some View {
        if let stage {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text("\(stage.sequence)")
                            .font(.title.weight(.black))
                            .foregroundStyle(.white)
                            .frame(width: 44, height: 44)
                            .background(AbbottTheme.stageColor(for: stage.id), in: Circle())

                        VStack(alignment: .leading, spacing: 4) {
                            Text(stage.name)
                                .font(.title2.weight(.bold))
                                .foregroundStyle(AbbottTheme.navy)
                            Text("Lifecycle Phase")
                                .font(.caption)
                                .foregroundStyle(AbbottTheme.mutedText)
                        }
                    }

                    Text(stage.description)
                        .font(.body)
                        .foregroundStyle(AbbottTheme.mutedText)

                    HStack {
                        stageNavButton("Previous", delta: -1)
                        Spacer()
                        stageNavButton("Next", delta: 1)
                    }

                    Text("Teams Involved")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(AbbottTheme.navy)

                    FlowLayout(spacing: 8) {
                        ForEach(stage.teamIDs, id: \.self) { teamID in
                            if let team = SDLCContent.teamsByID[teamID] {
                                Button {
                                    onTeamTap(teamID)
                                } label: {
                                    SDLCChip(title: team.name, color: AbbottTheme.stageColor(for: stage.id))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding(20)
            }
        }
    }

    private func stageNavButton(_ title: String, delta: Int) -> some View {
        Button(title) {
            guard let index = SDLCContent.stages.firstIndex(where: { $0.id == selectedStageID }) else { return }
            let next = (index + delta + SDLCContent.stages.count) % SDLCContent.stages.count
            selectedStageID = SDLCContent.stages[next].id
        }
        .font(.footnote.weight(.semibold))
        .buttonStyle(.bordered)
        .tint(AbbottTheme.blue)
    }
}

struct TeamDetailSheet: View {
    let teamID: String
    let onStageTap: (String) -> Void

    private var team: SDLCTeam? { SDLCContent.teamsByID[teamID] }

    private var participatingStages: [SDLCLifecycleStage] {
        SDLCContent.stages.filter { $0.teamIDs.contains(teamID) }
    }

    var body: some View {
        if let team {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 12) {
                        IconBadge(symbol: team.symbol, size: 44)
                        Text(team.name)
                            .font(.title3.weight(.bold))
                            .foregroundStyle(AbbottTheme.navy)
                    }

                    Text(team.description)
                        .font(.body)
                        .foregroundStyle(AbbottTheme.mutedText)

                    if participatingStages.isEmpty {
                        Text("Supports the SDLC across all phases.")
                            .font(.footnote.weight(.medium))
                            .foregroundStyle(AbbottTheme.blue)
                            .padding(12)
                            .background(AbbottTheme.sky, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    } else {
                        Text("Participates In")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(AbbottTheme.navy)

                        ForEach(participatingStages) { stage in
                            Button {
                                onStageTap(stage.id)
                            } label: {
                                HStack {
                                    Text("\(stage.sequence). \(stage.name)")
                                        .font(.subheadline.weight(.semibold))
                                        .foregroundStyle(AbbottTheme.stageColor(for: stage.id))
                                    Spacer()
                                    FlowArrowShape()
                                        .stroke(AbbottTheme.mutedText, lineWidth: 1.5)
                                        .frame(width: 18, height: 10)
                                }
                                .padding(12)
                                .background(AbbottTheme.sectionBackground, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(20)
            }
        }
    }
}

/// Simple flow layout for team chips (iOS 16+ compatible without Layout protocol dependency issues).
struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrange(proposal: proposal, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrange(proposal: proposal, subviews: subviews)
        for (index, frame) in result.frames.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + frame.minX, y: bounds.minY + frame.minY), proposal: .unspecified)
        }
    }

    private func arrange(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, frames: [CGRect]) {
        let maxWidth = proposal.width ?? LayoutMetrics.contentWidth
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var frames: [CGRect] = []

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth, x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            frames.append(CGRect(origin: CGPoint(x: x, y: y), size: size))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
        }

        return (CGSize(width: maxWidth, height: y + rowHeight), frames)
    }
}

// MARK: - Root View

struct SDLCInfographicView: View {
    @State private var activeSelection: SDLCSelection?
    @State private var showDashboardFullScreen = false
    @State private var selectedStageID = "plan"
    @State private var teamNavigationPath = NavigationPath()
    @State private var teamSearchText = ""

    var body: some View {
        NavigationStack(path: $teamNavigationPath) {
            ScrollView {
                VStack(alignment: .leading, spacing: LayoutMetrics.sectionSpacing) {
                    DocumentHeaderView(document: SDLCContent.document)
                    GoalGridSection(activeSelection: $activeSelection)
                    PrinciplesSection(activeSelection: $activeSelection)
                    LifecycleSection(
                        activeSelection: $activeSelection,
                        selectedStageID: $selectedStageID
                    )
                    TeamsSection(
                        activeSelection: $activeSelection,
                        searchText: $teamSearchText
                    )
                    BenefitsSection(activeSelection: $activeSelection)
                    ProductsSection(
                        activeSelection: $activeSelection,
                        onOpenDashboard: {
                            showDashboardFullScreen = true
                        }
                    )
                    CybersecuritySection(activeSelection: $activeSelection)
                }
                .padding(.horizontal, LayoutMetrics.horizontalPadding)
                .padding(.vertical, 16)
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarHidden(true)
            .navigationDestination(for: SDLCSelection.self) { selection in
                if case .team = selection {
                    SDLCDetailSheet(
                        selection: selection,
                        selectedStageID: $selectedStageID,
                        onTeamTap: { _ in }
                    )
                }
            }
        }
        .sheet(item: $activeSelection, onDismiss: {
            teamNavigationPath = NavigationPath()
        }) { selection in
            NavigationStack(path: $teamNavigationPath) {
                SDLCDetailSheet(
                    selection: selection,
                    selectedStageID: $selectedStageID,
                    onTeamTap: { teamID in
                        teamNavigationPath.append(SDLCSelection.team(teamID))
                    }
                )
                .navigationDestination(for: SDLCSelection.self) { nested in
                    SDLCDetailSheet(
                        selection: nested,
                        selectedStageID: $selectedStageID,
                        onTeamTap: { _ in }
                    )
                }
            }
            .presentationDetents(detents(for: selection))
            .presentationDragIndicator(.visible)
        }
        .fullScreenCover(isPresented: $showDashboardFullScreen) {
            MViewDashboardPreview()
        }
    }

    private func detents(for selection: SDLCSelection) -> Set<PresentationDetent> {
        switch selection {
        case .lifecycleStage, .lifecycleOverview, .team, .product:
            return [.medium, .large]
        case .cybersecurityOverview:
            return [.large]
        default:
            return [.medium]
        }
    }
}

// MARK: - Preview (iPhone 15 Pro)

#Preview("iPhone 15 Pro", traits: .fixedLayout(width: 393, height: 852)) {
    SDLCInfographicView()
}

#Preview("iPhone 15 Pro – Dark", traits: .fixedLayout(width: 393, height: 852)) {
    SDLCInfographicView()
        .preferredColorScheme(.dark)
}
