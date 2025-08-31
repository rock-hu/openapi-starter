--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: server_hit; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE server_hit (
    visit_id character varying(20) NOT NULL,
    content_id character varying(255) NOT NULL,
    hit_start_date_time timestamp with time zone NOT NULL,
    hit_type_id character varying(20) NOT NULL,
    num_of_bytes numeric(20,0),
    running_time_millis numeric(20,0),
    user_login_id character varying(255),
    status_id character varying(20),
    request_url character varying(2000),
    referrer_url character varying(2000),
    server_ip_address character varying(20),
    server_host_name character varying(255),
    internal_content_id character varying(20),
    party_id character varying(20),
    id_by_ip_contact_mech_id character varying(20),
    ref_by_web_contact_mech_id character varying(20)
);


-- ALTER TABLE public.server_hit OWNER TO ofbiz;

--
-- Name: server_hit pk_server_hit; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY server_hit
    ADD CONSTRAINT pk_server_hit PRIMARY KEY (visit_id, content_id, hit_start_date_time, hit_type_id);


--
-- Name: server_hit_shtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX server_hit_shtyp ON server_hit USING btree (hit_type_id);


--
-- Name: server_hit_visit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX server_hit_visit ON server_hit USING btree (visit_id);


--
-- Name: server_hit server_hit_shtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY server_hit
    ADD CONSTRAINT server_hit_shtyp FOREIGN KEY (hit_type_id) REFERENCES server_hit_type(hit_type_id);


--
-- Name: server_hit server_hit_visit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY server_hit
    ADD CONSTRAINT server_hit_visit FOREIGN KEY (visit_id) REFERENCES visit(visit_id);


--
-- PostgreSQL database dump complete
--

