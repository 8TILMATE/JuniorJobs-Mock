import 'package:junior_jobs_mock/core/brand_assets.dart';

import '../models/chat_thread.dart';
import '../models/community_post.dart';
import '../models/job_post.dart';
import '../models/student_profile.dart';

class MockContentRepository {
  List<JobPost> getJobs() {
    return const [
      JobPost(
        company: 'Stage Dining',
        role: 'Ospatar',
        location: 'Bucuresti',
        pay: 'EUR 20/hr',
        duration: '10 saptamani',
        workMode: WorkMode.onSite,
        summary: 'Fii legatura dintre serviciile Stage si clienti.',
        skills: ['Comunicare', 'Organizare', 'Atentie'],
        gradientColors: [0xFF07111F, 0xFF0D56B3, 0xFF2595FF],
        videoUrl: BrandAssets.stageOspatarAsset ?? '',
        videoPrompt:
            'Concluzie-AI: Videoclipul prezinta cerintele pentru a fi angajat ca ospatar in cadrul Stage Dining.',
        isInternship: true,
      ),
      JobPost(
        company: 'Stage Dining',
        role: 'Bucatar',
        location: 'Galati',
        pay: 'EUR 1,150/luna',
        duration: '6 luni',
        workMode: WorkMode.onSite,
        summary:
            'Alatura-te elitei culinare si adu zambetul pe fata clientilor Stage!',
        skills: ['Gatit', 'Ritual', 'Echipa'],
        gradientColors: [0xFF07111F, 0xFF123C7A, 0xFF2595FF],
        videoUrl: BrandAssets.stageChefAsset ?? '',
        videoPrompt:
            'Concluzie-AI: Videoclipul prezinta un anunt pentru un bucatar tanar in cadrul Stage Dining.',
        isInternship: false,
      ),
      JobPost(
        company: 'Hotel Bordeaux',
        role: 'Receptioner',
        location: 'Galati',
        pay: 'EUR 900/luna',
        duration: '12 luni',
        workMode: WorkMode.onSite,
        summary:
            'Fii pregatit sa aduci zambetul pe fata clientilor Hotel Bordeaux!',
        skills: ['Clienti', 'Receptie', 'Comunicare'],
        gradientColors: [0xFF07111F, 0xFF0D56B3, 0xFF8BCBFF],
        videoUrl: BrandAssets.hotelBordeauxAsset ?? '',
        videoPrompt:
            'Concluzie-AI: Meseria prezinta experienta ca receptioner la Hotel Bordeaux.',
        isInternship: false,
      ),
    ];
  }

  List<CommunityPost> getCommunityPosts() {
    return const [
      CommunityPost(
        author: 'Magdalena, 17',
        school: 'Colegiul National I. L. Caragiale',
        timeAgo: 'acum 12 min',
        title: 'Cat de lung ar trebui sa fie VideoCV-ul?',
        body:
            'Am primit raspunsuri mai bune dupa ce l-am redus la 42 de secunde si am aratat direct un proiect.',
        badge: 'VideoCV',
        previewLabel: 'Structura VideoCV',
        accentColor: 0xFF2595FF,
        replies: 18,
        saves: 7,
      ),
      CommunityPost(
        author: 'Jonas, mentor',
        school: 'Mentor Junior Jobs',
        timeAgo: 'azi, 14:20',
        title: 'Se primesc portofolii pentru feedback',
        body:
            'Trimite un proiect si rolul dorit. Raspund cu trei imbunatatiri practice.',
        badge: 'Mentor',
        previewLabel: 'Review portofoliu',
        accentColor: 0xFF8BCBFF,
        replies: 32,
        saves: 19,
      ),
      CommunityPost(
        author: 'Elena, 18',
        school: 'Liceul Teoretic Nicolae Iorga',
        timeAgo: 'ieri',
        title: 'Primul interviu este maine',
        body:
            'Aveti sfaturi pentru a explica proiectele de la scoala fara sa par ca recit un text?',
        badge: 'Interviu',
        previewLabel: 'Pregatire interviu',
        accentColor: 0xFF0D56B3,
        replies: 11,
        saves: 4,
      ),
    ];
  }

  List<ChatThread> getChatThreads() {
    return const [
      ChatThread(
        company: 'Northstar Labs',
        contact: 'Ari, coordonator design',
        lastMessage:
            'Ne-a placut VideoCV-ul tau. Poti trimite si CV-ul clasic?',
        time: '09:41',
        unreadCount: 2,
      ),
      ChatThread(
        company: 'Pulse Robotics',
        contact: 'Echipa de recrutare',
        lastMessage: 'Aplicarea ta a trecut la etapa de analiza cu mentor.',
        time: 'Ieri',
        unreadCount: 0,
      ),
      ChatThread(
        company: 'GreenByte Studio',
        contact: 'Lea, recrutare',
        lastMessage: 'Brief-ul pentru rolul la distanta este atasat in anunt.',
        time: 'Lun',
        unreadCount: 1,
      ),
    ];
  }

  StudentProfile getProfile() {
    return const StudentProfile(
      name: 'Mititelu Bianca',
      headline: 'Eleva in cautare de stagii si roluri de inceput',
      school: 'Colegiul National "Costache Negri"',
      city: 'Bucuresti',
      videoCvStatus: 'VideoCV pregatit',
      skills: ['Figma', 'CapCut', 'HTML', 'Lucru in echipa'],
      portfolioItems: [
        'CV clasic.pdf',
        'Studiu de caz redesign app',
        'Demo robotica scoala',
      ],
    );
  }
}
