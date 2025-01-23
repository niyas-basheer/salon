/// The `ServiceListData` class represents a list of service data.
class ServiceListData {
  ServiceListData._();

  /// A list of service data.
  static const List<dynamic> list = [
    {
      "id": 1,
      "icon": "assets/img/services/haircut_ic.png",
      "title": "Haircut",
      "sub_services": [
        {
          "id": 1,
          "name": "Classic Haircut",
          "about":
              "This is a timeless and versatile haircut that suits a wide range of face shapes and styles. It involves clean lines and a well-balanced length.",
          "image": "",
          "price": 3.5,
          "timing": "1hrs",
          "selected": false,
        },
        {
          "id": 2,
          "name": "Layered Cut",
          "about":
              "Layers add texture and movement to the hair. This type of haircut is suitable for those looking for a more dynamic and voluminous appearance.",
          "image": "",
          "price": 2.8,
          "timing": "1hrs",
          "selected": false,
        },
        {
          "id": 3,
          "name": "Pixie Cut",
          "about":
              "A short, chic haircut that is both trendy and low-maintenance. It's a bold choice that can highlight facial features and create a modern look.",
          "image": "",
          "price": 4.2,
          "timing": "1hrs",
          "selected": false,
        },
        {
          "id": 4,
          "name": "Bob Cut",
          "about":
              "Bobs come in various lengths and styles, such as the classic bob, the long bob (lob), and the asymmetrical bob. They offer a stylish and sophisticated appearance.",
          "image": "",
          "price": 4.2,
          "timing": "1hrs",
          "selected": false,
        },
        {
          "id": 5,
          "name": "Fade or Undercut",
          "about":
              "This haircut involves a gradual transition from short to long hair, often starting with a shaved or closely cropped section at the sides or back. Fades and undercuts can be customized based on client preferences.",
          "image": "",
          "price": 4.5,
          "timing": "1.2hrs",
          "selected": false,
        },
      ]
    },
    {
      "id": 2,
      "icon": "assets/img/services/makeup_ic.png",
      "title": "Makeup",
      "sub_services": [
        {
          "id": 8,
          "name": "Natural or Everyday",
          "about":
              "A subtle and minimalistic makeup look suitable for everyday wear. It enhances the client's features without appearing overly done, creating a fresh and natural appearance.",
          "image": "",
          "price": 3.2,
          "timing": "1hrs"
        },
        {
          "id": 9,
          "name": "Glamorous or Evening",
          "about":
              "This is a more dramatic and bold makeup look suitable for special occasions, events, or evenings out. It often involves smoky eyes, bold lips, and contouring to create a glamorous and standout appearance.",
          "image": "",
          "price": 4.9,
          "timing": "1.8hrs"
        },
        {
          "id": 10,
          "name": "Bridal Makeup",
          "about":
              "Bridal makeup is tailored for brides on their wedding day. It typically includes long-lasting, photo-friendly makeup that enhances the bride's natural beauty while ensuring she looks radiant throughout the day.",
          "image": "",
          "price": 1.5,
          "timing": "1.3hrs"
        },
        {
          "id": 11,
          "name": "Special Effects (SFX)",
          "about":
              "SFX makeup involves creating artistic and realistic special effects, such as wounds, scars, fantasy characters, or theatrical looks. This service is popular for events like Halloween, costume parties, or theatrical performances.",
          "image": "",
          "price": 2.7,
          "timing": "1.6hrs"
        },
        {
          "id": 12,
          "name": "Airbrush Makeup",
          "about":
              "Airbrush makeup is applied using an airbrush gun, creating a flawless and long-lasting finish. It's known for its lightweight feel and is often chosen for events where the makeup needs to withstand heat and humidity, such as weddings or photo shoots.",
          "image": "",
          "price": 4.4,
          "timing": "1.1hrs"
        },
      ]
    },
    {
      "id": 3,
      "icon": "assets/img/services/spa_ic.png",
      "title": "Spa",
      "sub_services": [
        {
          "id": 13,
          "name": "Relaxation Massage",
          "about":
              "A soothing and gentle massage aimed at promoting relaxation and reducing stress. Techniques may include Swedish massage, aromatherapy, and hot stone massage to enhance the overall experience.",
          "image": "",
          "price": 3.5,
          "timing": "1.8hrs"
        },
        {
          "id": 14,
          "name": "Facial Treatments",
          "about":
              "Offer a variety of facial treatments tailored to different skin types and concerns. This could include hydrating facials, deep-cleansing facials, anti-aging treatments, or specialty masks to address specific skin issues.",
          "image": "",
          "price": 2.8,
          "timing": "1.5hrs"
        },
        {
          "id": 15,
          "name": "Body Scrubs and Wraps",
          "about":
              "Provide exfoliating body scrubs to remove dead skin cells and promote smooth, radiant skin. Additionally, offer body wraps that can detoxify, hydrate, or firm the skin, providing a luxurious and pampering experience.",
          "image": "",
          "price": 4.2,
          "timing": "1.2hrs"
        },
      ]
    },
    {
      "id": 4,
      "icon": "assets/img/services/nails_ic.png",
      "title": "Nails",
      "sub_services": [
        {
          "id": 16,
          "name": "Manicures",
          "about":
              "Traditional manicures involve shaping and grooming the nails, cuticle care, and polishing with nail color or a clear coat. You can offer various nail shapes, lengths, and a wide range of nail polish colors to suit your clients' preferences.",
          "image": "",
          "price": 3.7,
          "timing": "1.9hrs"
        },
        {
          "id": 17,
          "name": "Pedicures",
          "about":
              "Pedicures focus on the care and beautification of the feet and toenails. This typically includes toenail shaping, cuticle maintenance, exfoliation, and moisturizing. You can offer different types of pedicures such as spa pedicures with additional massage and treatments for relaxation.",
          "image": "",
          "price": 4.5,
          "timing": "1.6hrs"
        },
        {
          "id": 18,
          "name": "Nail Art",
          "about":
              "Nail art involves the application of creative designs and patterns on the nails. This can include hand-painted designs, decals, gems, and other embellishments to add a personalized and artistic touch to the nails. Nail art services provide a way for clients to express their individual style.",
          "image": "",
          "price": 2.3,
          "timing": "1.1hrs"
        },
      ]
    },
    {
      "id": 5,
      "icon": "assets/img/services/coloring_ic.png",
      "title": "Coloring",
      "sub_services": [
        {
          "id": 19,
          "name": "Root Touch-Up",
          "about":
              "A root touch-up service is designed to cover or blend in new hair growth at the roots, extending the life of a client's previous hair color application. It's a great option for clients looking to maintain a consistent color between full-color appointments.",
          "image": "",
          "price": 4.8,
          "timing": "1.7hrs"
        },
        {
          "id": 20,
          "name": "Balayage",
          "about":
              "Balayage is a freehand hair coloring technique that creates a natural and gradual transition between darker and lighter shades. It's a popular choice for clients who want a sun-kissed, low-maintenance look with softer regrowth lines.",
          "image": "",
          "price": 4.8,
          "timing": "1.7hrs"
        },
        {
          "id": 21,
          "name": "Color Correction",
          "about":
              "Color correction services are for clients who want to change or adjust their current hair color. This may involve correcting uneven tones, removing unwanted shades, or achieving a completely new color. It often requires advanced skills and expertise.",
          "image": "",
          "price": 3.2,
          "timing": "1.4hrs"
        },
        {
          "id": 22,
          "name": "Highlights and Lowlights",
          "about":
              "Highlights involve adding lighter strands to the hair, while lowlights add darker tones. This technique adds dimension and depth to the hair, creating a multi-dimensional and vibrant look. Clients can choose from various highlighting and lowlighting options based on their preferences.",
          "image": "",
          "price": 4.9,
          "timing": "1.8hrs"
        },
      ]
    },
    {
      "id": 6,
      "icon": "assets/img/services/facial_ic.png",
      "title": "Facial",
      "sub_services": [
        {
          "id": 23,
          "name": "Root Touch-Up",
          "about":
              "A root touch-up service is designed to cover or blend in new hair growth at the roots, extending the life of a client's previous hair color application. It's a great option for clients looking to maintain a consistent color between full-color appointments.",
          "image": "",
          "price": 1.5,
          "timing": "1.3hrs"
        },
        {
          "id": 24,
          "name": "Anti-Aging Facial",
          "about":
              "Tailored for clients looking to address signs of aging, an anti-aging facial may include treatments with ingredients like retinol, peptides, and antioxidants. It aims to reduce fine lines, wrinkles, and promote a more youthful appearance.",
          "image": "",
          "price": 2.7,
          "timing": "1.6hrs"
        },
        {
          "id": 25,
          "name": "Acne-Fighting Facial",
          "about":
              "Geared towards clients with acne-prone or problematic skin, this facial targets blemishes and helps control excess oil. It may involve deep cleansing, exfoliation, and the use of products with ingredients like salicylic acid or benzoyl peroxide.",
          "image": "",
          "price": 4.4,
          "timing": "1.1hrs"
        },
        {
          "id": 26,
          "name": "Brightening or Skin Tone Correcting",
          "about":
              "Ideal for clients with uneven skin tone or hyperpigmentation, this facial treatment focuses on brightening and balancing the complexion. Ingredients like vitamin C, niacinamide, and exfoliants may be incorporated to promote a more even skin tone.",
          "image": "",
          "price": 4.4,
          "timing": "1.1hrs"
        },
      ]
    },
    {
      "id": 7,
      "icon": "assets/img/services/waxing_ic.png",
      "title": "Waxing",
      "sub_services": [
        {
          "id": 27,
          "name": "Full Body Waxing",
          "about":
              "This service involves the removal of hair from various parts of the body, including legs, arms, underarms, and bikini area. It provides clients with a smooth and hair-free finish for an extended period.",
          "image": "",
          "price": 3.5,
          "timing": "1.8hrs"
        },
        {
          "id": 28,
          "name": "Brazilian Waxing",
          "about":
              "Brazilian waxing is a popular choice for clients who want hair removal in the bikini area, including the removal of hair from the front, back, and everything in between. It offers a clean and hair-free look, especially suitable for beachwear or special occasions.",
          "image": ""
        },
        {
          "id": 29,
          "name": "Eyebrow and Facial Waxing",
          "about":
              "This service includes shaping and grooming the eyebrows, as well as removing unwanted facial hair, such as upper lip, chin, and sideburns. It helps to define the eyebrows and create a polished facial appearance.",
          "image": "",
          "price": 2.8,
          "timing": "1.5hrs"
        },
      ]
    },
    {
      "id": 8,
      "icon": "assets/img/services/massage_ic.png",
      "title": "Massage",
      "sub_services": [
        {
          "id": 30,
          "name": "Swedish Massage",
          "about":
              "Swedish massage is a classic and widely popular massage technique that involves long, flowing strokes, kneading, and circular motions. It focuses on promoting relaxation, improving circulation, and relieving muscle tension. This type of massage is suitable for clients seeking a soothing and stress-relieving experience.",
          "image": "",
          "price": 3.7,
          "timing": "1.9hrs"
        },
        {
          "id": 31,
          "name": "Deep Tissue Massage",
          "about":
              "Deep tissue massage is a more intense and therapeutic massage technique that targets deeper layers of muscle and connective tissue. It can be beneficial for clients with chronic pain, muscle tightness, or those seeking relief from specific areas of tension. The therapist uses firm pressure and various techniques to release knots and tightness.",
          "image": "",
          "price": 4.5,
          "timing": "1.6hrs"
        },
      ]
    },
  ];
}
