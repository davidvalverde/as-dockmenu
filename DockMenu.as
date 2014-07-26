/**
 * @author dmvalverde
 */
class com.davidvalverde.ui.DockMenu {
	
	/**
	 * Alineación de los iconos del menú.
	 */
	public static var TOP: Number = 0;
	public static var CENTER: Number = 1;
	public static var BOTTOM: Number = 2;
	public static var LEFT: Number = 3;
	public static var RIGHT: Number = 4;
	
	public static var ALIGN_MIN: Number = TOP;
	public static var ALIGN_MAX: Number = RIGHT;
	
	/**
	 * Orientación del menú.
	 */
	public static var HORIZONTAL: Number = 0;
	public static var VERTICAL: Number = 1;
	
	/**
	 * Separación entre iconos.
	 */
	private static var BORDER: Number = 5;
	
	/**
	 * Escala máxima que pueden tener los iconos del menú. 100 es el valor que tienen en su estado
	 * normal, 50 sería la mitad y 200 el doble.
	 */
	private static var SCALE: Number = 200;
	
	/**
	 * Posición X del Scroll.
	 */
	private var m_x: Number;
	
	/**
	 * Posición Y del Scroll.
	 */
	private var m_y: Number;
	
	/**
	 * Alineación del menú. Por defecto: CENTER.
	 */
	private var m_align: Number;
	
	/**
	 * Orientación del menú. Por defecto: HORIZONTAL.
	 */
	private var m_orientation: Number;
	
	/**
	 * Borde de separación entre los iconos del menú. Por defecto: BORDER.
	 */
	private var m_border: Number;
	
	/**
	 * Escala máxima del icono. Por defecto: SCALE.
	 */
	private var m_scale: Number;
	
	/**
	 * Longitud del menú que dependiendo de su orientación puede ser la altura o la anchura.
	 */
	private var m_menuLength: Number;
	
	/**
	 * Ruta donde se va a colocar el menú.
	 */
	private var m_timeline_mc: MovieClip;
	
	/**
	 * DockMenu. Contendrá a todos los iconos del menú.
	 */
	private var m_holder_mc: MovieClip;
	
	/**
	 * Array de los Iconos (MCs) que se encuentran en el menú.
	 */
	private var m_icons_rgmc: Array;
	
	///// PUBLIC //////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * DockMenu()<br/>
	 * DockMenu(MovieClip)<br/>
	 * <p>Constructor de la clase que inicializa los atributos de la misma.</p>
	 * 
	 * @param timeline Ruta o MovieClip donde se va a poner el menú. 
	 */
	public function DockMenu(timeline: MovieClip) {
		if (timeline != undefined) {
			m_timeline_mc = timeline;
		} else {
			m_timeline_mc = _root;
		}
		
		m_x = 0;
		m_y = 0;
		m_align = CENTER;
		m_orientation = HORIZONTAL;
		m_border = BORDER;
		m_scale = SCALE;
		m_menuLength = m_border;		
	}
	
	/**
	 * generateDockMenu()<br/>
	 * <p>Crea el DockMenu a partir de las propiedades indicadas.</p>
	 */
	public function generateDockMenu(): Void {
		m_icons_rgmc = new Array();
		
		this.createHolder();
	}
	
	///// GETTERS y SETTERS ///////////////////////////////////////////////////////////////////////
	
	public function get _x(): Number {
		return m_x;
	}
	
	public function set _x(x: Number): Void {
		m_x = x;
	}
	
	public function get _y(): Number {
		return m_y;
	}
	
	public function set _y(y: Number): Void {
		m_y = y;
	}
	
	public function get _align(): Number {
		return m_align;
	}
	
	public function set _align(align: Number): Void {
		if ((align >= ALIGN_MIN) && (align <= ALIGN_MAX)) {
			m_align = align;
		} else {
			m_align = CENTER;
		}
	}
	
	public function get _orientation(): Number {
		return m_orientation;
	}
	
	public function set _orientation(orientation: Number): Void {
		if (orientation == VERTICAL) {
			m_orientation = VERTICAL;
		} else {
			m_orientation = HORIZONTAL;
		}
	}
	
	public function get _border(): Number {
		return m_border;
	}
	
	public function set _border(border: Number): Void {
		if (border >= 0) {
			m_border = border;
		} else {
			m_border = 0;
		}
	}
	
	public function get _scale(): Number {
		return m_scale;
	}
	
	public function set _scale(scale: Number): Void {
		if (scale < 100) {
			m_scale = 100;
		} else {
			m_scale = scale;
		}
	}
	
	public function get _timeline(): MovieClip {
		return m_timeline_mc;
	}
	
	public function set _timeline(timeline: MovieClip): Void {
		m_timeline_mc = timeline;
	}
	
	
	///// PRIVATE /////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * createHolder()<br/>
	 * <p>Crea el contenedor donde se colocarán todos los iconos del menú.</p>
	 */
	private function createHolder(): Void {
		m_holder_mc = m_timeline_mc.createEmptyMovieClip("holder", m_timeline_mc.getNextHighestDepth());
		m_holder_mc._x = m_x;
		m_holder_mc._y = m_y;
		
		m_menuLength = m_border;
	}
	
	//--------------//
	//      _
	//     | | 
	//     | | 
	//     | | 
	//    _| |_
	//    \   /
	//     \ /
	//      '
	//
	/**
	 * addIcon(MovieClip)<br/>
	 * <p>Añade un nuevo icono al menú.</p>
	 * 
	 * @param icon Icono que se añade al menú.
	 */
	private function addIcon(icon: MovieClip): Void {
		m_icons_rgmc.push(icon);
	}
	
	private function paintIcons(): Void {
		
	}
} // end class